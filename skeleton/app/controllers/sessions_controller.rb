class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:username], params[:password])

    if user
      #take us to home page
      login(user)
      redirect_to cats_url
    else
      flash[:errors] = ["Incorrect login info"]
      render :new
      #send back to login
    end

  end

  def destroy
    logout
    redirect_to cats_url
  end





end
