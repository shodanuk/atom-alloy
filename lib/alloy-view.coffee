{View} = require 'atom'

module.exports =
class TitaniumView extends View
  @content: ->
    @div class: 'titanium overlay from-top', =>
      @div "The Titanium package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "titanium:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "TitaniumView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
