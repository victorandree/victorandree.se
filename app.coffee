###
Application factory

This is the main setup point for this app. Usage:

  app_factory = require './app'
  app = app_factory(config)

###
express = require 'express'

module.exports = (config) ->
  app = express()

  app.set 'port', config.port
  app.set 'hostname', config.hostname
  app.set 'env', config.env

  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.locals.basedir = config.views.basedir

  if app.set('env') == 'development'
    app.use express.logger 'dev'

  app.use express.static __dirname + '/public'
  app.use express.favicon __dirname + '/public/favicon.ico'
  app.use express.urlencoded()
  app.use express.json()
  app.use express.methodOverride()
  app.use app.router

  if app.set('env') == 'development'
    app.use express.errorHandler()

  app.use '/cv', require('cv')(config)

  return app
