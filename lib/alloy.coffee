AlloyView = require './alloy-view'

module.exports =
  alloyView: null

  activate: (state) ->
    @alloyView = new AlloyView(state.alloyViewState)

  deactivate: ->
    @alloyView.destroy()

  serialize: ->
    alloyViewState: @alloyView.serialize()
