class WorksController < ApplicationController
  
  def index
    @movies = Work.where(category: "movie")

    @albums = Work.where(category: "album")

    @books = Work.where(category: "book")
  end

  def show
    @work = Work.find_by(id: params[:id])

    if !@work
      flash[:error] = "No work with that ID found."
      redirect_to works_path
    end
  end

end
