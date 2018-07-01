class Track < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :chapters
  
  # To Do: rename user_track_progress to learning_track_progress
  has_many :user_track_progresses
  has_many :learners, through: :user_track_progresses, foreign_key: "user_id", source: :user

end