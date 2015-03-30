AlloyView = require './alloy-view'
{CompositeDisposable} = require 'atom'

module.exports =
  alloyView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @alloyView = new AlloyView(state.alloyViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @alloyView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'alloy:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @alloyView.destroy()

  serialize: ->
    alloyViewState: @alloyView.serialize()

  toggle: ->
    console.log 'Alloy was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
