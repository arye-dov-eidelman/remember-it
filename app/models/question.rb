class Question < ActiveRecord::Base
  
  validates :title,  presence: true

  belongs_to :quiz
  has_one :chapter, through: :quiz

  has_one :quiz, through: :question
  has_one :chapter, through: :quiz
  has_one :track, through: :chapter
  has_one :owner, through: :track

  has_many :answers

end