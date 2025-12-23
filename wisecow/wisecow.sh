#!/usr/bin/env bash

export PATH=$PATH:/usr/games
PORT=4499

cat <<'EOF' > server.py
from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        fortune = subprocess.check_output(["/usr/games/fortune"]).decode()
        cowsay = subprocess.check_output(["cowsay", fortune]).decode()
        body = f"<pre>{cowsay}</pre>".encode()

        self.send_response(200)
        self.send_header("Content-Type", "text/html")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

HTTPServer(("0.0.0.0", 4499), Handler).serve_forever()
EOF

echo "Wisdom served on port=$PORT..."
python3 server.py
