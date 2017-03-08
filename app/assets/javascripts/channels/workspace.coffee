App.workspace = App.cable.subscriptions.create "WorkspaceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.user_code != myCodeMirror.getDoc().getValue()
      console.log(data.user_code)
      myCodeMirror.getDoc().setValue(data.user_code)



