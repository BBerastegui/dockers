import os

from flask import Flask

app = Flask(__name__)

@app.route('/refresh-dns')
def hello_world():
    bashCommand = "/bin/sh /entrypoint.sh"
    import subprocess
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    return 'OK'

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))

