class Quiz < ActiveRecord::Base
  validates :title,  presence: true

  belongs_to :chapter
  has_one :track, through: :chapter
  has_one :owner, through: :track

  has_many :questions


end