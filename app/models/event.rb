class Event < ApplicationRecord
  validate :title, :start_time, presence: true

  has_many :event_volunteer_memberships, dependent: :destroy
  has_many :volunteers, through: :event_volunteer_membership
end
