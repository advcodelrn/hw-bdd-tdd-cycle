require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  describe "searching movies with same director" do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it "should call the model method to find all movies with same director" do
      expect(Movie).to receive(:where).with(director: 'Ridley Scott').
        and_return(@fake_results)
      get :search_director, {:director => 'Ridley Scott'}
    end
    it "should select the search_director template for rendering" do
      Movie.stub(:where).and_return(@fake_results)
      get :search_director, {:director => "Ridley Scott"}
      expect(response).to render_template('search_director')
    end
    it "should make search results available to that template" do
      Movie.stub(:where).and_return(@fake_results)
      get :search_director, {:director => "Ridley Scott"}
      expect(assigns(:movies)).to eq(@fake_results)
    end
    it "should make director name available to that template" do
      Movie.stub(:where).and_return(@fake_results)
      get :search_director, {:director => "Ridley Scott"}
      expect(assigns(:director)).to eq("Ridley Scott")
    end
  end
end