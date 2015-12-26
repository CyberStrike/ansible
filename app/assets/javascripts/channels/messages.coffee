App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    console.log 'connected'
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append @addIncomingMessage(data)
    console.log data


  addIncomingMessage: (data) ->
    $('.chat-item-container')
      .append "<div class='chat-item'><span class='user-avatar'><img src='http://placehold.it/50x50'></span>" +
        "<p class='user-name'>#{ data.user }</p>" +
         "<p class='text'>#{ data.message }</p></div>"
      .animate {scrollTop: $(".chat-item").last().offset().top}, 500