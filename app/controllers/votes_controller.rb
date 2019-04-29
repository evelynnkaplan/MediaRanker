class VotesController < ApplicationController
  def add_vote
    @user = User.find_by(id: session[:user_id])
    work = Work.find_by(id: params[:id])

    if @user
      vote = Vote.create!(user: @user, work: work)
      if vote
        work.add_vote(vote)
        @user.add_vote(vote)
        flash[:success] = "Successfully upvoted!"
        redirect_to work_path(work)
      else
        flash[:error] = "Error saving the vote."
        redirect_to work_path(work)
      end
    else
      flash[:error] = "A problem occurred: You must log in to do that"
      redirect_to work_path(work)
    end
  end
end
