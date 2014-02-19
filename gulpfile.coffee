gulp = require 'gulp'

gulp.task 'assets', ['stylesheets'], ->
  gulp.src('assets/favicon.ico')
    .pipe(gulp.dest('./public'))

gulp.task 'stylesheets', ->
  console.log "stylesheets"

gulp.task 'watch', ->
  gulp.watch './assets', ['assets']

gulp.task 'default', ['assets', 'watch']
