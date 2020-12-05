class EventType < ApplicationRecord
  validates :key, :display_name, presence: true

  has_many :event_event_type_memberships, dependent: :destroy
  has_many :events, through: :event_id
end
