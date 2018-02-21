class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /movies
  def index
    @movies = Movie.order(:ranking)
    render json: @movies
  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    puts "I AM THE PARAMS", params
    @movie = Movie.new(movie_params)
    @movie.ranking = Movie.all.length + 1

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    puts "MOVIE", @movie


    if @movie.update(movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_params
      params.require(:movie).permit(:title, :overview, :poster_path, :release_date, :vote_average, :ranking)
    end
end
