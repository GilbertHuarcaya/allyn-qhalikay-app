class RecordsCreator
  def initialize(appointment:, clinic:)
    @appointment = appointment
    @clinic = clinic
  end

  def create
    record = Record.create!(appointment: @appointment, clinic: @clinic)

    ActiveCable.server.broadcast(
      "wall_channel",
      {
        id: record.id,
        appointment: record.appointment,
        clinic: record.clinic,
        user: record.user,
      }
    )
  end
end
