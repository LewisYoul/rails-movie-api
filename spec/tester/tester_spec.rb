require_relative '../rails_helper'

describe "a tester" do
  it "can add two numbers" do
    expect(2+2).to eq(4)
  end
  it "knows what a movie is" do
    movie = Movie.new(
      title: "Cars",
      overview: "A summary",
      poster_path: "route to pic",
      release_date: "the day it came out",
      vote_average: 5.4
    )
    p "I AM THE COUNT", Movie.count
    movie.save
    p "I AM THE COUNT", Movie.count

  end
end
