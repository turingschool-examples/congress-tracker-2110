class User < ApplicationRecord
  validates_uniqueness_of :email
  has_secure_password

  enum role: %w(default manager admin)
end
