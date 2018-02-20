class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :overview
  validates_presence_of :poster_path
  validates_presence_of :release_date
  validates_presence_of :vote_average

  def self.title_exists?(title)
    if Movie.find_by(title: title)
      true
    else
      false
    end
  end
end
