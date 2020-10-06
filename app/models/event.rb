class Event < ApplicationRecord
  validate :title, :start_time, presence: true
  validates :not_in_past

  has_many :confirmed_event_volunteer_memberships,
           -> { where(response: EventVolunteerMembership.responses[:confirmed]) },
           class_name: "EventVolunteerMembership",
           dependent: :destroy
  has_many :confirmed_volunteers,
           class_name: "Volunteer",
           through: :confirmed_event_volunteer_memberships

  has_many :pending_event_volunteer_memberships,
           -> { where(response: EventVolunteerMembership.responses[:pending]) },
           class_name: "EventVolunteerMembership",
           dependent: :destroy
  has_many :pending_volunteers,
           class_name: "Volunteer",
           through: :pending_event_volunteer_memberships

  def capacity_volunteers?
    confirmed_volunteers.count >= max_volunteers
  end

  private

  def not_in_past
    if start_time < Time.zone.now
      errors.add(:start_time, "Start Time must be a future date")
    end
  end
end
