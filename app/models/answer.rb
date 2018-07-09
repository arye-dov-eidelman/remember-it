class Answer < ActiveRecord::Base
  validates :content,  presence: true
  # validates :is_correct,  presence: true

  belongs_to :quiz
  has_one :chapter, through: :quiz
  has_one :track, through: :chapter
  has_one :owner, through: :track
end