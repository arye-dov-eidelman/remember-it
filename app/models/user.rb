class User < ActiveRecord::Base
  has_secure_password
  has_many :learning_tracks, through: :learning_tracks source: :tracks
  has_many :curriculum_tracks, through: :curriculum_tracks, source: :tracks
end