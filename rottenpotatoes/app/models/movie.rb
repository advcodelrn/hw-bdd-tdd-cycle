class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.search_director(id)
    movie = Movie.find(id)
    if movie && movie.director
      Movie.where(director: movie.director).to_a
    end
  end
end
