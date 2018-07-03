class Chapter < ActiveRecord::Base
  validates :title,  presence: true

  belongs_to :track
  has_one :owner, through: :track

  has_many :quizzes
  has_many :questions, through: :quizzes
  
end