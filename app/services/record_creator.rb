class RecordsCreator
  def initialize(appointment:, clinic_id:, user_id:)
    @appointment = appointment
    @clinic_id = clinic_id
    @user_id = user_id
  end

  def create
    record = Record.create!(appointment: @appointment, clinic_id: @clinic_id, user_id: @user_id)

    ActiveCable.server.broadcast(
      "record_channel",
      {
        id: record.id,
        appointment: record.appointment,
        clinic_id: record.clinic_id,
        user_id: record.user_id,
      }
    )
  end
end
