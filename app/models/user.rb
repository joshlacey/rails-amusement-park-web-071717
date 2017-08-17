class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, :password_digest, presence: true

  has_secure_password

  def mood
    if self.happiness >= self.nausea
      "happy"
    elsif self.happiness < self.nausea
      "sad"
    end
  end

end
