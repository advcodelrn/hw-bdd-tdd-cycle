describe Movie do
  describe "search movies with same director" do
    it "should find the movie with specified id" do
      d = double(director: true, title: true)
      d.stub(:director).and_return("Ridley Scott")
      d.stub(:title).and_return("Alien")
      expect(Movie).to receive(:find).with("1").and_return(d)
      Movie.search_director("1")
    end
    
    it "should search movies with the specified director" do
      d = double(director: true, title: true)
      d.stub(:director).and_return("Ridley Scott")
      d.stub(:title).and_return("Alien")
      Movie.stub(:find).and_return(d)
      expect(Movie).to receive(:where).with(director: d.director)
      Movie.search_director("1")
    end
  end
end