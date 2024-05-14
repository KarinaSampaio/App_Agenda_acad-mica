from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

# Configuração da conexão com o banco de dados
config = {
    'user': 'root',
    'password': 'somos@2021',
    'host': 'localhost',
    'database': 'agenda_academica',
    'raise_on_warnings': True
}

@app.route('/')
def index():
    db = mysql.connector.connect(**config)
    cursor = db.cursor()

    # Exemplo de consulta para buscar todos os usuários
    cursor.execute("SELECT * FROM usuarios")
    users = cursor.fetchall()

    cursor.close()
    db.close()

    # Passando os dados para o template
    return render_template('index.html', usuarios=users)

if __name__ == "__main__":
    app.run(debug=True)
