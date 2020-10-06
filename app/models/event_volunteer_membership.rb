class EventVolunteerMembership < ApplicationRecord
  validates :event_id, :volunteer_id, presence: true
  validates :event_id, uniqueness: { scope: :volunteer_id }
  enum response: {
    no: "NO",
    confirmed: "CONFIRMED",
    pending: "PENDING",
    waiting_list: "WAITING_LIST"
  }

  belongs_to :event
  belongs_to :volunteer

  before_save :populate_invite_hash

  private

  def populate_invite_hash
    self.invite_hash = SecureRandom.hex
  end
end
