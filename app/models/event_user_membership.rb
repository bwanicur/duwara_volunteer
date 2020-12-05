class EventUserMembership < ApplicationRecord
  validates :event_id, :user_id, presence: true
  validates :event_id, uniqueness: { scope: :user_id }
  validates :response, inclusion: { in: VALID_RESPONSES.values }

  VALID_REPONSES = {
    no: "NO",
    confirmed: "CONFIRMED",
    waiting_list: "WAITING_LIST"
  }.freeze

  belongs_to :event
  belongs_to :user

  before_create :populate_invite_hash

  private

  def populate_invite_hash
    self.invite_hash = SecureRandom.hex
  end
end
