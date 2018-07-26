class User < ActiveRecord::Base
  has_secure_password

  validates :first_name,  presence: true
  validates :last_name,  presence: true
  validates :email,     presence: true, uniqueness: true, email: true
  validates :password,  presence: true

  # To Do: rename user_track_progress to somthing better!
  has_many :user_track_progresses
  has_many :learning_tracks, through: :user_track_progresses, foreign_key: "track_id", source: :track # not working
  has_many :owned_tracks, class_name: "Track", foreign_key: "owner_id"

  def full_name
    self.first_name + ' ' + self.last_name
  end

  # properly capitlize the first name
  def first_name
    self[:first_name].split(' ').collect{|name| name.capitalize}.join(' ')
  end

  # properly capitlize the last name
  def last_name
    self[:last_name].split(' ').collect{|name| name.capitalize}.join(' ')
  end
end
