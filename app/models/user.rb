class User < ActiveRecord::Base
  has_secure_password
  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email,     presence: true, uniqueness: true
  validates :password,  presence: true

  has_many :learning_tracks, through: :learning_tracks, source: :tracks,  class_name: "Track"
  has_many :curriculum_tracks, through: :curriculum_tracks, source: :tracks, class_name: "Track"

  def full_name
    self.first_name.capitalize + ' ' + self.last_name.capitalize
  end
end