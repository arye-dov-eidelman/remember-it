class Track < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :chapters
  has_many :quizzes, through: :chapters
  has_many :questions, through: :quizzes
  
  # To Do: rename user_track_progress to somthing better!
  has_many :user_track_progresses
  has_many :learners, through: :user_track_progresses, foreign_key: "user_id", source: :user

end