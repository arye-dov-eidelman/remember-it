class User < ActiveRecord::Base
  has_secure_password

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email,     presence: true, uniqueness: true
  validates :password,  presence: true

  # To Do: rename user_track_progress to learning_track_progress
  has_many :user_track_progresses
  has_many :learning_tracks, through: :user_track_progresses, foreign_key: "track_id", source: :track # not working
  has_many :owned_tracks, class_name: "Track", foreign_key: "owner_id"

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def first_name
    self[:first_name].split(' ').collect{|name| name.capitalize}.join(' ')
  end

  def last_name
    self[:last_name].split(' ').collect{|name| name.capitalize}.join(' ')
  end
end