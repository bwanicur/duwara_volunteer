class EventVolunteerMembership < ApplicationRecord
  validate :event_id, :volunteer_id, presence: true
  validate :event_id, uniqueness: { scope: :volunteer_id }

  belongs_to :event
  belongs_to :volunteer

  before_save :populate_invite_hash

  def pending?
    response.nil?
  end

  def accepted?
    response == true && !last_replied_on.nil?
  end

  def rejected?
    response == false
  end

  private

  def populate_invite_hash
    self.invite_hash = SecureRandom.hex
  end
end
