class User < ApplicationRecord
  authenticates_with_sorcery!

  VALID_ROLES = %w[
    volunteer
    admin
  ]

  validate :valid_roles

  before_create :set_defaults

  def is_admin?
    roles.include?('admin')
  end

  private

  def valid_roles
    VALID_ROLES.any?(roles)
  end

  def set_defaults
    self.roles ||= ["volunteer"]
  end
end
