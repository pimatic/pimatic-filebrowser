module.exports = (env) ->
  
  # ##Dependencies
  assert = env.require 'cassert'
  express = env.require 'express' 

  # ##Filebrowser
  class FileBrowser extends env.plugins.Plugin
    init: (app, server, @config) ->
      env.helper.checkConfig env, 'frontend.filebrowser', ->
        assert config.mappings? and Array.isArray config.mappings

      for mapping in config.mappings
        app.use mapping.path, express.directory mapping.directory, icons: true
        app.use mapping.path, express.static mapping.directory

  return new FileBrowser 