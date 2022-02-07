import consumer from "./consumer";

consumer.subscriptions.create("RecordChannel", {
  connected() {
  },
  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  received(data) {
    const messagesContainer = document.getElementById(`records-user-${data.user}`);
    if (messagesContainer) {
    messagesContainer.insertAdjacentHTML('afterbegin', data.data); // called when data is broadcast in the cable
    }
  },
});
