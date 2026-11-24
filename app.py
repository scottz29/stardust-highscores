from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <html>
    <body style="background:#020814;color:white;font-family:Arial;text-align:center;">
    <h1 style="color:#ffd900">STARDUST ARCADE</h1>
    <h2>High Scores Coming Soon</h2>
    </body>
    </html>
    '''

if __name__ == '__main__':
    app.run(debug=True)
