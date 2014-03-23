TitaniumView = require './titanium-view'

module.exports =
  titaniumView: null

  activate: (state) ->
    @titaniumView = new TitaniumView(state.titaniumViewState)

  deactivate: ->
    @titaniumView.destroy()

  serialize: ->
    titaniumViewState: @titaniumView.serialize()
    
