class RecordChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_for record_channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
