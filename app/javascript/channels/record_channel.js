import consumer from "./consumer";


const initRecordCable = () => {
  const messagesContainer = document.getElementById('records');
  if (messagesContainer) {
    consumer.subscriptions.create("RecordChannel", {
      connected() {
        console.log("Connected to RecordChannel");
      },
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
      received(data) {
        console.log(data);
        messagesContainer.insertAdjacentHTML('beforeend', data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initRecordCable };
