module View {

  function user_update(message msg) {
    line =
      <div class="row line">
        <div class="span1 userpic" />
        <div class="span2 user">{msg.author}:</div>
        <div class="span2 message">{msg.text}</div>
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
      onready={function(_) { Model.register_message_callback(user_update) }} />
    <div id=#footer class="navbar navbar-fixed-bottom">
      <div class=container>
        <div class=input-append>
          <input id=#entry class="input-xxlarge" type="text"
            onnewline={function(_) { broadcast(author) }}>
          <button class="btn btn-primary" type="button"
            onclick={function(_) { broadcast(author) }}>Post</button>
        </div>
      </div>
    </div>
  }

  function default_page() {
    author = Model.new_author();
    Resource.page("Opa chat", page_template(chat_html(author)));
  }

}
