class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.verify(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Incorrect username or password."
      render 'new'
    else
      sign_in user
      redirect_to :root
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
