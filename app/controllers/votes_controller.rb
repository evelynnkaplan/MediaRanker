class VotesController < ApplicationController
  def add_vote
    @user = User.find_by(id: session[:user_id])
    work = Work.find_by(id: params[:id])
    vote = Vote.create!(user: @user, work: work)
    if vote
      work.add_vote(vote)
      @user.add_vote(vote)
      flash[:success] = "Successfully upvoted!"
      redirect_to work_path(work)
    end
  end
end
