from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def index():
    message = os.getenv("MESSAGE", "¡Hola desde Docker!")
    return f"<h1>{message}</h1><p>Version 1.0 · Flask + Docker · /health</p>"

@app.get("/health")
def health():
    return jsonify(status="ok")

if __name__ == "__main__":
    # Bind to 0.0.0.0 so it's reachable from the container port mapping
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8000")))
