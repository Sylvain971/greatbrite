class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, ready for some awesomness ?"

      redirect_to root_path
    else
      flash.now[:danger] = "It seems like you're not one of us ?"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Hope to see you soon !"
    redirect_to root_path
  end

end
