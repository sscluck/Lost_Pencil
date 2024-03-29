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

    if params[:posting][:found] == "true"
      @posting.found_by = current_user
      if @posting.update_attributes(params[:posting])
        flash[:success] = "Found notification sent."
        redirect_to :root
      else
        flash[:error] = "Something went wrong."
        redirect_to :root
      end

    else
      @posting.found_by = nil
      if @posting.update_attributes(params[:posting])
        flash[:success] = "Posting resubmitted."
        redirect_to :root
      else
        flash[:error] = "Something went wrong."
        redirect_to :root
      end
    end

  end

  def destroy
    @posting = Posting.find(params[:id])
    @hero = User.find(@posting.found_by)
    if (@posting.difficulty) == "Piece of cake"
      @hero.points += 1
    elsif (@posting.difficulty) == "Not too bad"
      @hero.points += 2
    else
      @hero.points += 3
    end
    @hero.save
    @posting.destroy
    redirect_to user_path(current_user)
  end

end
