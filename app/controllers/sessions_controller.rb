class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end
  
  def create
    name = params[:name]
    if name && name.length > 0
      session[:name] = name
      redirect_to secrets_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:name) if session[:name]
    redirect_to login_path
  end

end
