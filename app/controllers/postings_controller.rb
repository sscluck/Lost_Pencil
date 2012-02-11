class PostingsController < ApplicationController
  def new
    @posting = Posting.new
  end

  def create
    @posting = Posting.new(params[:posting])
    @posting.date = DateTime.current()
    @posting.user_id = current_user.id
    @posting.found = "false"
    if @posting.save
      flash[:success] = "Posting successful"
      redirect_to new_posting_path
    else
      flash[:error] = "Uhoh! Posting not successful :("
      render 'new'
    end
  end

  def update
    @posting = Posting.find(params[:id])
    if @posting.update_attributes(params[:posting])
      flash[:success] = "Found notification sent."
      redirect_to :root
    else
      flash[:error] = "Something went wrong."
      redirect_to :root
    end
  end

end
