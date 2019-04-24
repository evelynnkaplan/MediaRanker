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

  def new
    @work = Work.new
    @categories = ["album", "book", "movie"]
  end

  def create
    work_params = {
      category: params[:work][:category],
      title: params[:work][:title],
      creator: params[:work][:creator],
      pub_year: params[:work][:pub_year],
      description: params[:work][:description]
    }

    work = Work.new(work_params)

    work.save

    redirect_to works_path
  end
end
