class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by(:uid => auth['uid']) do |user|
      user.name = auth['info']['name']
    end
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
