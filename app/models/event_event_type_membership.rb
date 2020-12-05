class EventEventTypeMembership < ApplicationRecord
  validates :event_id, uniqueness: { scope: :event_type_id }

  belongs_to :event
  belongs_to :event_type
end
