{View} = require 'atom'

module.exports =
class AlloyView extends View
  @content: ->
    @div class: 'alloy overlay from-top', =>
      @div "The Alloy package is Alive! ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "alloy:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AlloyView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
