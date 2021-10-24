from flask import Flask
from flask_pyctuator.flask_pyctuator import FlaskPyctuator

app = Flask("Flask App with Pyctuator")


@app.route("/")
def hello():
    return "Hello World!"


FlaskPyctuator(
    app,
    pyctuator_endpoint_url="http://host.docker.internal:5000/pyctuator",
)

app.run(debug=False, port=5000, host="0.0.0.0")
