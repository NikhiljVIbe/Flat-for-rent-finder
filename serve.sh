#!/bin/bash
set -e
cd "$(dirname "$0")"
PORT=${1:-8000}

if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null 2>&1; then
  echo "Port $PORT is already in use. Try a different port:"
  echo "  ./serve.sh 8001"
  exit 1
fi

echo ""
echo "Noida Apartment Map"
echo "---------------------------------"
echo "  Map:      http://localhost:$PORT/"
echo "  Listings: http://localhost:$PORT/listings.html"
echo ""
echo "  Press Ctrl+C to stop the server"
echo "---------------------------------"
echo ""

(sleep 1 && open "http://localhost:$PORT/") &

if command -v python3 >/dev/null 2>&1; then
  python3 -m http.server $PORT
elif command -v python >/dev/null 2>&1; then
  python -m SimpleHTTPServer $PORT
else
  echo "Error: Python not found. Install Python 3 or run with Node:"
  echo "  npx serve -p $PORT"
  exit 1
fi
