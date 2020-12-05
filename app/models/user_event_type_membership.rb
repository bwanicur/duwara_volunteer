class UserEventTypeMembership < ApplicationRecord
  validates :user_id, uniqueness: { scope: :event_type_id }
end

