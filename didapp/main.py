from random import randint
import psycopg2
from flask import Flask, render_template, redirect, url_for, Markup, Blueprint
from didapp.db import get_db
bp = Blueprint('jeu', __name__)


def get_db_connection():
    return get_db()


@bp.route('/')
@bp.route('/regle')
def index():
    return render_template('regle.html')


@bp.route('/jeu')
def jeu():
    phase, cartes = plateau_courrant()
    return render_template('plateau.html', phase=phase, cartes=cartes)


def plateau_courrant():
    conn = get_db_connection()
    with conn.cursor() as cur:
        cur.execute("""
        SELECT titre, definition, questions FROM phase 
        WHERE est_courante = TRUE limit 1;
        """)
        phase = cur.fetchone()

        phase = {'titre': phase[0],
                'definition': phase[1],
                'questions': Markup(phase[2])}
            

        cur.execute("""
        SELECT type_carte, texte FROM carte
         WHERE est_courante = TRUE;
        """)
        cartes = []
        for row in cur.fetchall():
            carte = {'type':row[0],
                    'texte': Markup(row[1])}
            cartes.append(carte)

        return phase, cartes


@bp.route('/pioche')
def piocher_carte():
    alea = randint(1,3)
    conn = get_db_connection()
    with conn.cursor() as cur:
        cur.execute("""
        SELECT id FROM carte WHERE est_pioche = FALSE ORDER BY random() limit %s;
        """ % alea)
        ids = [x[0] for x in cur.fetchall()]
        print(ids)
        if ids:
            cur.execute("""
            UPDATE carte SET est_pioche = TRUE, est_courante = TRUE
            WHERE id in %s;
            """, (tuple(ids),))
        conn.commit()

    return redirect(url_for('jeu.jeu'))


@bp.route('/suivante')
def phase_suivante():
    conn = get_db_connection()
    with conn.cursor() as cur:
        cur.execute("""
        SELECT phase_suivante_id FROM phase
        WHERE est_courante = TRUE limit 1;
        """)
        suivante_id = cur.fetchone()

        if not suivante_id or not suivante_id[0]:
            return redirect(url_for('jeu.fin'))

        cur.execute("""
        UPDATE phase SET est_courante = FALSE WHERE est_courante = TRUE;
        """)

        cur.execute("""
        UPDATE carte SET est_courante = FALSE;
        """)

        cur.execute("""
        UPDATE phase SET est_courante = TRUE WHERE id = %s;
        """, suivante_id)

        conn.commit()

    return redirect(url_for('jeu.jeu'))


@bp.route('/fin')
def fin():
    conn = get_db_connection()
    with conn.cursor() as cur:
        cur.execute("""
        UPDATE carte SET est_pioche = FALSE, est_courante = FALSE;
        """)
        cur.execute("""
        UPDATE phase SET est_courante = FALSE;
        """)
        cur.execute("""
        UPDATE phase SET est_courante = TRUE WHERE id = 0;
        """)

        conn.commit()

    return render_template('fin.html')
