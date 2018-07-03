class UserTrackProgress < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  # To Do: rename user_track_progress to somthing better!
end