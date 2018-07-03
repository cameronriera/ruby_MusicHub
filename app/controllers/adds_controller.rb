class AddsController < ApplicationController
  def create
    @addedsong = Add.new(song_id: params[:id])
    @addedsong.user_id = current_user.id
    @addedsong.save
    redirect_to dashboard_path
  end
end
