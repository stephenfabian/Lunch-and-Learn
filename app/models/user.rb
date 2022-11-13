class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :api_key, presence: true, uniqueness: true

  has_many :favorites
  
  def self.generate_random_key 
    rand.to_s[2..16].to_i
  end
end
