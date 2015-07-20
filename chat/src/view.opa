module View {

  function user_update(message msg) {
    line =
      <div class="row line">
        <img src="https://avatars.githubusercontent.com/{msg.author}" class="userpic" />
        <span class="user">{msg.author}</span>
        <span class="message">{msg.text}</span>
      </div>
    #conversation =+ line;
    Dom.scroll_to_bottom(#conversation);
  }

  function broadcast(author) {
    text = Dom.get_value(#entry);
    Model.broadcast(~{author, text});
    Dom.clear_value(#entry);
  }

  function page_template(content) {
    <div id=#main>
      {content}
    </div>
  }

  function chat_html(author) {
    <div id=#conversation class="container-fluid"
      onready={
        function(_) {
          Dom.give_focus(#entry);
          Model.register_message_callback(user_update);
        }
      } />
    <div id=#footer class="navbar navbar-fixed-bottom">
      <div class="container-fluid">
        <div class=input-append>
          <input id=#entry class="form-control" type="text" placeholder="Write a message..."
            onnewline={function(_) { broadcast(author) }}>
        </div>
      </div>
    </div>
  }

  function default_page() {
    author = Model.new_author();
    Resource.page("Opa chat", page_template(chat_html(author)));
  }

}
