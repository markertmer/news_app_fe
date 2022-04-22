class UsersController < ApplicationController
  before_action :require_user, only: :dashboard

  def create
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']
    name = auth_hash['info']['name']
    user = User.find_by(email: email)
    if user
      session[:access_token] = auth_hash['credentials']['token']
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      new_user = User.create!(email: email, name: name)
      session[:access_token] = auth_hash['credentials']['token']
      session[:user_id] = new_user.id
      redirect_to '/dashboard'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def dashboard
    @user = User.find(session[:user_id])
  end
end
