class PostingsController < ApplicationController
  def new
    @posting = Posting.new
  end

  def create
    @posting = Posting.new(params[:posting])
    @posting.date = DateTime.current()
    @posting.user_id = current_user.id
    if @posting.save
      flash[:success] = "Posting successful"
      render 'new'
    else
      flash[:error] = "Uhoh! Posting not successful :("
      render 'new'
    end
  end
end
