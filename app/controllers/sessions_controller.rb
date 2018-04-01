class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:session][:email]
    if user.try :authenticate, params[:session][:password]
      session[:user_id] = user.id
      return redirect_to user
    end
    render 'new', notice: 'Invalid email or password'
  end

  def destroy
    session[:user_id] = nil if session[:user_id]
    redirect_to root_path
  end
end
