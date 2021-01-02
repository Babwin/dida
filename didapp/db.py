import psycopg2
from flask import current_app, g
from flask.cli import with_appcontext
import click

def init_connection():
    return psycopg2.connect("dbname=dida user=dida")

def get_db():
    if 'db' not in g:
        g.db = init_connection() 
    else:
        try:
            g.db.isolation_level
        except sycopg2.InterfaceError as oe:
            conn = init_connection()
    return g.db

def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()

def init_db():
    conn = get_db()
    with current_app.open_resource('schema.sql') as f:
        with conn.cursor() as cur:
            cur.execute(f.read())

@click.command('init-db')
@with_appcontext
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Initialized the database.')

def init_app(app):
    app.teardown_appcontext(close_db)
    app.cli.add_command(init_db_command)
