require_relative '../rails_helper'

describe Movie do

  before(:each) do
  end

  describe "Validations" do
    it "is not valid without a title" do
      movie = Movie.new(title: nil)
      expect(movie).to_not be_valid
    end
    it "is not valid without an overview" do
      movie = Movie.new(title: "Cars", overview: nil)
      expect(movie).to_not be_valid
    end
    it "is not valid without a poster_path" do
      movie = Movie.new(title: "Cars", overview: "overview", poster_path: nil)
      expect(movie).to_not be_valid
    end
    it "is not valid without a release_date" do
      movie = Movie.new(
        title: "Cars",
        overview: "overview",
        poster_path: "path",
        release_date: nil
      )
      expect(movie).to_not be_valid
    end
    it "is not valid without a vote_average" do
      movie = Movie.new(
        title: "Cars",
        overview: "overview",
        poster_path: "path",
        release_date: "date",
        vote_average: nil
      )
      expect(movie).to_not be_valid
    end
    it "is valid when all attributes are given" do
      movie = Movie.new(
        title: "Cars",
        overview: "A summary",
        poster_path: "route to pic",
        release_date: "the day it came out",
        vote_average: 5.4
      )
      expect(movie).to be_valid
    end
  end

  describe "Create" do
    it "can add a movie to the database" do
      expect { Movie.create(
        title: "Cars",
        overview: "A summary",
        poster_path: "route to pic",
        release_date: "the day it came out",
        vote_average: 5.4
      )}.to change { Movie.count }.by(1)
    end
  end


  describe "Read" do

    it "can read a movie from the database" do
      Movie.create(
        title: "Cars",
        overview: "A summary",
        poster_path: "route to pic",
        release_date: "the day it came out",
        vote_average: 5.4
      )
      expect(Movie.where(title: "Cars")).to exist
    end
  end

  describe "Update" do
    it "can update a movie in the database" do
      Movie.create(
        title: "Cars",
        overview: "A summary",
        poster_path: "route to pic",
        release_date: "the day it came out",
        vote_average: 5.4
      )
      movie = Movie.find_by(title: "Cars")
      movie.title = "Cars 2"
      movie.save
      expect(Movie.where(title: "Cars")).not_to exist
      expect(Movie.where(title: "Cars 2")).to exist

    end
  end

  describe "Delete" do
    it "can delete a movie from the database" do
      Movie.create(
        title: "Cars",
        overview: "A summary",
        poster_path: "route to pic",
        release_date: "the day it came out",
        vote_average: 5.4
      )
      movie = Movie.find_by(title: "Cars")
      expect { movie.destroy }.to change { Movie.count }.by(-1)
    end
  end
end
