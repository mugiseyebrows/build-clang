jinja2 -D CC=gcc build.pbat.tmpl > build-mingw.pbat
jinja2 -D CC=cl build.pbat.tmpl > build-msvc.pbat
pbat