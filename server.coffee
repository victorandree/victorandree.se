#!/usr/bin/env NODE_PATH=lib coffee
###
Creates an app from a configuration and starts a server.
###
colors = require 'colors'
config = require './config-default'

if process.env.VASE_CONFIG
  for key, value of require(process.env.VASE_CONFIG)
    config[key] = value

app = require('./app')(config)

port      = app.set 'port'
hostname  = app.set 'hostname'
env       = app.set 'env'

server = app.listen port, hostname, ->
  console.log "server up on #{ hostname }:#{ port } (#{ env })".green
  console.log ""

server.on 'error', (e) ->
  console.log "could not start server #{ hostname }:#{ port }:".red

  switch e.code
    when 'EADDRINUSE' then console.log "address already in use"
    when 'EADDRNOTAVAIL' then console.log "address is not available"
    else console.log e.code
