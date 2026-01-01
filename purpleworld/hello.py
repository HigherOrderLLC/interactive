from http.server import SimpleHTTPRequestHandler, HTTPServer

class HelloHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(
            b"<html>"
            b"<head><title>Hello World</title></head>"
            b"<body>"
            b"<h1>Hello, World!</h1>"
            b"<p>This is a simple Python web server.</p>"
            b"</body>"
            b"</html>"
        )

if __name__ == "__main__":
    server_address = ('', 8000)
    httpd = HTTPServer(server_address, HelloHandler)
    print("Serving on http://localhost:8000 ...")
    httpd.serve_forever()