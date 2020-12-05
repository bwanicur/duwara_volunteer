class Event < ApplicationRecord
  validates :title, presence: true
  validate :valid_or_template
  validate :not_in_past

  has_many :event_event_type_memberships, dependent: :destroy
  has_many :event_types, through: :event_id

  has_many :confirmed_event_user_memberships,
           -> { where(response: EventUserMembership.responses[:confirmed]) },
           class_name: "EventUserMembership",
           dependent: :destroy
  has_many :confirmed_users,
           class_name: "User",
           through: :confirmed_event_user_memberships

  has_many :pending_event_user_memberships,
           -> { where(response: nil) },
           class_name: "EventUserMembership",
           dependent: :destroy
  has_many :pending_users,
           class_name: "User",
           through: :pending_event_user_memberships

  def capacity_users?
    confirmed_users.count >= max_users
  end

  private

  def not_in_past
    return true if is_template

    if start_time < Time.zone.now
      errors.add(:start_time, "Start Time must be a future date")
    end
  end

  def valid_or_template
    return true if is_template

    start_time.present?
  end
end
