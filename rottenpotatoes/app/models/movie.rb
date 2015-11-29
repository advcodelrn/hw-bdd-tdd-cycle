class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.search_director(id)
    movie = Movie.find(id)
    if movie && movie.director
      movies = Movie.where(director: movie.director).to_a
      [movies, movie.title]
    else
      [false, movie.title]
    end
  end
end
