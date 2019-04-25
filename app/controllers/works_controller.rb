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
    work = Work.new(work_params)

    work.save

    redirect_to works_path
  end

  def edit
    @work = Work.find_by(id: params[:id])
    @categories = ["album", "book", "movie"]
  end

  def update
    @work = Work.find_by(id: params[:id])
    @work.update(work_params)

    redirect_to work_path(@work.id)
  end

  def destroy
    @work = Work.find_by(id: params[:id])

    @work.destroy

    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :pub_year, :description)
  end
end
