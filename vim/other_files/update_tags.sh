find . -maxdepth 1 -type d -exec vim -u NONE -c "helptags {}/doc" -c q \;
