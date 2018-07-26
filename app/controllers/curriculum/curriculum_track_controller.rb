class CurriculumTrackController < CurriculumController

  # new track page
  get "/tracks/new" do
    erb :'tracks/new'
  end

  # create a new track and optionally create chapters as well
  post '/tracks' do
    track = Track.new(params[:track])
    track.owner = @user
    
    # create any submitted chapters
    track.chapters << params[:chapters].collect do |chapter_params|
      Chapter.create(chapter_params) if !chapter_params[:title].strip.empty?
    end.compact

    if track.save
      create_message("We've successfully Created the learning track \"#{track.title}\"", "successful")
      redirect "tracks/#{track.id}/edit"
    else
      create_message("That's odd. We couldn't create that Learning track.", "failure")
      redirect "/tracks/new"
    end
  end

  # track edit page
  get "/tracks/:track_id/edit" do
    (return 404) if !(@track = Track.find_by(id: params[:track_id]))
    (return 403) if @track.owner != @user
    erb :'tracks/edit'
  end
  
  # update the track
  patch '/tracks/:track_id' do
    (return 404) if !(track = Track.find_by(id: params[:track_id]))
    (return 403) if track.owner != @user

    # edit chapter titles
    if params[:chapters]
      params[:chapters].each do |chapter_id, chapter_values|
        if !chapter_values[:title].strip.empty?
          chapter = Chapter.find_by(id: chapter_id)
          chapter.title = chapter_values[:title].strip
          chapter.save
        else
          chapter = Chapter.find_by(id: chapter_id)
          chapter.destroy
        end
      end
    end

    # create new chapters
    if params[:new_chapters]
      track.chapters << params[:new_chapters].collect do |chapter_params|
        Chapter.create(chapter_params) if !chapter_params[:title].strip.empty?
      end.compact
    end

    # update the track
    if track.update(params[:track])
      create_message("We've successfully updated the learning track \"#{track.title}\"", "successful")
      redirect "tracks/#{track.id}/edit"
    else
      create_message("That's odd. We couldn't update that Learning track.", "failure")
      redirect "tracks/#{track.id}/edit"
    end
  end
end
