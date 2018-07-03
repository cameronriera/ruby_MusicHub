class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @adders = Add.select([:user_id], :song_id).distinct.where(song_id: params[:id])
    @song = Song.find(params[:id])
  end

  def create
    @song = Song.create(song_params)       
    this_id = current_user.id
    if @song.valid?
      puts "SONG NOT IN DB!! AND IS VALID!!"
      redirect_to dashboard_path
    elsif @song.errors
      messages = []
      @song.errors.full_messages.each { |message| messages << message }
      flash[:errors] = messages
      redirect_to dashboard_path
    end
  end


  private
    def song_params
      params.require(:song).permit(:title, :artist)
    end 
end
