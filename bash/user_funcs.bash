goog() {
  q=$(echo "$@" | tr " ", "+")
  url="https://www.google.ru/search?q=$q"
  sensible-browser "$url"
}

ddg() {
  q=$(echo "$@" | tr " ", "+")
  url="https://duckduckgo.com/?q=$q"
  sensible-browser "$url"
}
