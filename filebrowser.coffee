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
        unless mapping.hidden is true or mapping.hidden is false
          mapping.hidden = false
        unless mapping.view is "tiles" or mapping.view is "details"
          mapping.view = "tiles"

        options =
          icons: true,
          hidden: mapping.hidden,
          view: mapping.view

        app.use mapping.path, serveIndex mapping.directory, options
        app.use mapping.path, express.static mapping.directory

  return new FileBrowser