###
The CV app is responsible for the resume section of the website.

* Constructing and displaying the CV.
* Possible integration with other resume services (e.g. LinkedIn).
###
express = require 'express'

module.exports = (config) ->
  app = express()

  app.set 'views', __dirname + '/views'
  app.locals.basedir = config.views.basedir

  app.get '/', (req, res) -> res.render 'cv'

  return app
