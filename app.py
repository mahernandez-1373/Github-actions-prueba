# app.py (Flask application)

from flask import Flask, jsonify
import os
import psycopg2

app = Flask(__name__)

# Conexión a la base de datos PostgreSQL
def connect_to_database():
    conn = psycopg2.connect(
        host=os.getenv("DATABASE_HOST"),
        database="mydatabase",
        user="myuser",
        password="mypassword"
    )
    return conn

@app.route('/')
def index():
    conn = connect_to_database()
    cur = conn.cursor()
    cur.execute("SELECT * FROM mytable")
    data = cur.fetchall()
    conn.close()
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))

