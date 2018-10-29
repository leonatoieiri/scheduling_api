class Meeting < ApplicationRecord
  validates :room_id, :start_time, :end_time, presence: true

  validate :available_room

  belongs_to :room

  def available_room
    scheduled = Meeting.where("room_id = ? and
      ((start_time <= ? and ? <= end_time) or
      (start_time <= ? and ? <= end_time))", self.room_id,
      self.start_time, self.start_time,
      self.end_time, self.end_time)

    if scheduled.present?
      errors.add(:room_id, "Room unavailable for this time slot")
    end
  end
end
