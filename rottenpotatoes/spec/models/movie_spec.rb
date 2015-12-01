describe Movie do
  describe "search movies with same director" do
    it "should find the movie with specified id" do
      expect(Movie).to receive(:find).with("1")
      Movie.search_director("1")
    end
    
    it "should search movies with the specified director" do
      d = double(director: true)
      d.stub(:director).and_return("Ridley Scott")
      Movie.stub(:find).and_return(d)
      expect(Movie).to receive(:where).with(director: d.director)
      Movie.search_director("1")
    end
    
    it "should return movies with the specidied director" do
      d = double(director: true)
      d.stub(:director).and_return("Ridley Scott")
      movies = [d, d]
      Movie.stub(:find).and_return(d)
      Movie.stub(:where).and_return(movies)
      expect(Movie.search_director("1")).to eq(movies)
    end  
  end
end