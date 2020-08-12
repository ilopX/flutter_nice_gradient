cd example
call flutter build web
cd build\web
:: call del main.dart.js.map
call git init
call git add .
call git commit -m "this commit automatically generated from push script"
call git remote add origin https://github.com/ilopX/flutter_nice_gradient_platform_web
call git push origin master --force
