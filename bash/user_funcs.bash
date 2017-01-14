goog() {
  q=$(echo $* | tr " ", "+")
  url="https://www.google.ru/#newwindow=1&q=$q"
  sensible-browser $url
}
