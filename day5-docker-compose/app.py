from flask import Flask
import mysql.connector
import redis
import os

app = Flask(__name__)

@app.route('/')
def home():
    return "App is running!"

@app.route('/health')
def health():
    return "OK", 200

@app.route('/db')
def db_check():
    try:
        conn = mysql.connector.connect(
            host=os.environ.get('DB_HOST', 'db'),
            user=os.environ.get('DB_USER', 'appuser'),
            password=os.environ.get('DB_PASS', 'apppass'),
            database=os.environ.get('DB_NAME', 'appdb')
        )
        return "Database connected successfully!"
    except Exception as e:
        return f"Database error: {str(e)}", 500

@app.route('/redis')
def redis_check():
    try:
        r = redis.Redis(
            host=os.environ.get('REDIS_HOST', 'redis'),
            port=6379
        )
        r.set('test', 'hello from redis')
        value = r.get('test')
        return f"Redis connected! Value: {value.decode()}"
    except Exception as e:
        return f"Redis error: {str(e)}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
