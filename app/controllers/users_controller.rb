class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.points = 0
    if @user.save
      sign_in @user
      flash[:success] = "You signed up!"
      redirect_to :root

    else
      render 'new'
    end

  end

end
