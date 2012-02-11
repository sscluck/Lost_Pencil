class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "You signed up!"
      redirect_to :root

    else
      render 'new'
    end

  end

end
