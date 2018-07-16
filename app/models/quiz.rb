class Quiz < ActiveRecord::Base
  validates :title,  presence: true

  belongs_to :chapter
  has_one :track, through: :chapter
  has_one :owner, through: :track

  has_many :questions


  after_commit :update_successful
  after_rollback :update_failed
 
  def update_successful
    @successfully_updated = true
  end

  def update_failed
    @successfully_updated = false
  end

  def successfully_updated?
    @successfully_updated
  end
end