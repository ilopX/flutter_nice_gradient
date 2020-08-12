cd example
call flutter build web
cd build\web
call del main.dart.js.map
call git init
call git add .
call git commit -m "this commit automatically generated from push script"
call git push origin master
