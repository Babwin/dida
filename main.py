import psycopg2
import flask


@app.route('/hello/')
@app.route('/hello/<name>')
def index(name=None):
    return render_template('regle.html')


