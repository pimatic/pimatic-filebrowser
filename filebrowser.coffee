module.exports = (env) ->

# ##Dependencies
  assert = env.require 'cassert'
  express = env.require 'express'
  serveIndex = require 'serve-index'

  # ##Filebrowser
  class FileBrowser extends env.plugins.Plugin
    init: (app, framework, @config) ->
      assert @config.mappings? and Array.isArray @config.mappings

      for mapping in @config.mappings
        app.use mapping.path, serveIndex mapping.directory, icons: true
        app.use mapping.path, express.static mapping.directory

  return new FileBrowser