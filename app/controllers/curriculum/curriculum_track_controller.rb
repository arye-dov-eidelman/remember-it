class CurriculumTrackController < ApplicationController

  before do
    if !(@user = User.find_by(id: session[:user_id]))
      create_message("You need to be logged in to view that page.", "notice")
      redirect '/account/login'
    end
  end

  get "/tracks/new" do
    erb :'tracks/new'
  end

  post '/tracks' do
    binding.pry
    track = Track.new(params[:track])
    track.owner = @user
    
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

  get "/tracks/:track_id/edit" do
    (return 404) if !(@track = Track.find_by(id: params[:track_id]))
    (return 403) if @track.owner != @user
    erb :'tracks/edit'
  end
  
  patch '/tracks/:track_id' do
    (return 404) if !(track = Track.find_by(id: params[:track_id]))
    (return 403) if track.owner != @user

    # binding.pry
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

    if params[:new_chapters]
      track.chapters << params[:new_chapters].collect do |chapter_params|
        Chapter.create(chapter_params) if !chapter_params[:title].strip.empty?
      end.compact
    end

    if track.update(params[:track])
      create_message("We've successfully updated the learning track \"#{track.title}\"", "successful")
      redirect "tracks/#{track.id}/edit"
    else
      create_message("That's odd. We couldn't update that Learning track.", "failure")
      redirect "tracks/#{track.id}/edit"
    end
  end

  # get "/curriculum/:track/:chapter" do
  #   'Curriculum chapter'
  # end

  # get "/curriculum/:track/:chapter/:quiz" do
  #   'Curriculum quiz'
  # end

end
