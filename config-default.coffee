###
Default configuration for app.

Customize configuration by passing `VASE_CONFIG` environment variable with path
to a file similar to this one with overriding configuration.
###
module.exports =
  env: 'development'
  hostname: '0.0.0.0'
  port: '22081'
  views:
    basedir: __dirname + '/views'
