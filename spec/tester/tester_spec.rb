require_relative '../rails_helper'

describe Movie do

  before(:each) do

  end

  describe "Create Movie" do
    it "can add a movie to the database" do
      expect { Movie.create(
        title: "Cars",
        overview: "A summary",
        poster_path: "route to pic",
        release_date: "the day it came out",
        vote_average: 5.4
      )}.to change { Movie.count }
    end
  end

end
