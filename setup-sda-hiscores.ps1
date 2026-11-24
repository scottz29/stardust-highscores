Write-Host "Creating Stardust Arcade project..." -ForegroundColor Cyan

# Folders

$folders = @(
    "templates",
    "static",
    "static\css",
    "static\img",
    "instance"
)

foreach($folder in $folders){
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
}

# .gitignore

@(
"venv/",
"instance/",
"__pycache__/",
"*.pyc",
"stardust.db",
".env"
) | Set-Content ".gitignore"

# requirements.txt

@(
"Flask==3.0.3",
"Flask-SQLAlchemy==3.1.1",
"Flask-Login==0.6.3"
) | Set-Content "requirements.txt"

# app.py

@(
"from flask import Flask",
"",
"app = Flask(__name__)",
"",
"@app.route('/')",
"def home():",
"    return '''",
"    <html>",
"    <body style=""background:#020814;color:white;font-family:Arial;text-align:center;"">",
"    <h1 style=""color:#ffd900"">STARDUST ARCADE</h1>",
"    <h2>High Scores Coming Soon</h2>",
"    </body>",
"    </html>",
"    '''",
"",
"if __name__ == '__main__':",
"    app.run(debug=True)"
) | Set-Content "app.py"

# models.py

@(
"from flask_sqlalchemy import SQLAlchemy",
"",
"db = SQLAlchemy()",
"",
"class Player(db.Model):",
"    id = db.Column(db.Integer, primary_key=True)",
"    name = db.Column(db.String(100))",
"    initials = db.Column(db.String(3))",
"",
"class Game(db.Model):",
"    id = db.Column(db.Integer, primary_key=True)",
"    name = db.Column(db.String(100))"
) | Set-Content "models.py"

# seed.py

@(
"print('Seed placeholder')"
) | Set-Content "seed.py"

# templates

@(
"<!doctype html>",
"<html>",
"<head>",
"    <title>Stardust Arcade</title>",
"</head>",
"<body>",
"    {% block content %}{% endblock %}",
"</body>",
"</html>"
) | Set-Content "templates\base.html"

@(
"{% extends 'base.html' %}",
"{% block content %}",
"<h1>Leaderboard</h1>",
"{% endblock %}"
) | Set-Content "templates\leaderboard.html"

@(
"{% extends 'base.html' %}",
"{% block content %}",
"<h1>Login</h1>",
"{% endblock %}"
) | Set-Content "templates\login.html"

@(
"{% extends 'base.html' %}",
"{% block content %}",
"<h1>Dashboard</h1>",
"{% endblock %}"
) | Set-Content "templates\dashboard.html"

@(
"{% extends 'base.html' %}",
"{% block content %}",
"<h1>Players</h1>",
"{% endblock %}"
) | Set-Content "templates\players.html"

@(
"{% extends 'base.html' %}",
"{% block content %}",
"<h1>Games</h1>",
"{% endblock %}"
) | Set-Content "templates\games.html"

@(
"{% extends 'base.html' %}",
"{% block content %}",
"<h1>Scores</h1>",
"{% endblock %}"
) | Set-Content "templates\scores.html"

# css

@(
"body {",
"    background: #020814;",
"    color: white;",
"}"
) | Set-Content "static\css\stardust.css"

Write-Host ""
Write-Host "DONE!" -ForegroundColor Green
Write-Host ""
Write-Host "Next:"
Write-Host "python -m venv venv"
Write-Host ".\venv\Scripts\Activate.ps1"
Write-Host "pip install -r requirements.txt"
Write-Host "python app.py"