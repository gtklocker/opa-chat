type message = {
  string author,
  string text
}

module Model {

  private Network.network(message) room = Network.cloud("room");
  
  exposed function broadcast(message) {
    Network.broadcast(message, room);
  }

  function register_message_callback(callback) {
    Network.add_callback(callback, room);
  }

}
