class UsersController < ApplicationController
  layout "two_column", only: [:index]
  skip_before_action :require_login, only: [:create, :index]

  def index
      print "YOU ARE IN THE INDEX ROUTE // SUCCESS"
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      this_id = @user.id
      session[:user_id] = @user.id
      p "*******SESSION ID: #{session[:user_id]}"
      redirect_to dashboard_path
    elsif @user.errors
      messages = []
      @user.errors.full_messages.each { |message| messages << message }
      flash[:errors] = messages
      redirect_to root_path
    end
  end

  def show
    @usersongs = Add.select([:song_id], :user_id).distinct.where(user_id: params[:id])
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
