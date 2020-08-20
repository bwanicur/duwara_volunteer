class Volunteer < ApplicationRecord
  validate :first_name, :last_name, :email, presence: true
  validate :email, uniqueness: true

  has_many :event_volunteer_memberships, dependent: :destroy
  has_many :events, through: :event_volunteer_memberships
end
