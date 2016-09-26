class MoviesController < ApplicationController

  def index
    @movies = Movie.all.page(params[:page]).per(10)
    
    unless params[:search].blank?
      @movies = @movies.search(params[:search])
    end
    
    unless params[:duration].blank? 
      
      case params[:duration].to_i
      
      when 1
        @movies = @movies.short_duration(params[:duration])
      
      when 2
        @movies = @movies.med_duration(params[:duration])
      
      when 3
        @movies = @movies.long_duration(params[:duration])
      end
    end
  end

  def show
    # @movie = Movie.find(params[:id])
    @movie = Movie.includes(:reviews).find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end 
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

    def movie_params
      params.require(:movie).permit(:title, :release_date, :director, :runtime_in_minutes, :description, :picture, :user_id)
    end


end