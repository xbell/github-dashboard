class User < ActiveRecord::Base
  # validates :email, :username, :uid, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
  end

  def self.create_from_omniauth(auth_hash)
    # Create a user
  end

end
