class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "BRAVO LÀ ÇA GÈRE !"

      redirect_to reveal_path
    else
      flash.now[:danger] = "Mauvaise adresse ? Mauvais mdp ?"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Allez, ++ au revoir ! ;)"
    redirect_to root_path
  end

end
