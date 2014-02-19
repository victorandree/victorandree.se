gulp = require 'gulp'
less = require 'gulp-less'

gulp.task 'assets', ['less'], ->
  gulp.src 'assets/favicon.ico'
    .pipe gulp.dest './public'

gulp.task 'less', ->
  gulp.src './assets/less/*.less'
    .pipe less()
    .pipe gulp.dest './public/css'

gulp.task 'watch', ->
  gulp.watch './assets', ['assets']

gulp.task 'default', ['assets', 'watch']
