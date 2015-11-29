require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  describe "searching movies with same director" do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it "should call the model method to find all movies with same director" do
      expect(Movie).to receive(:search_director).with("1").
        and_return(@fake_results)
      get :search_director, {:id => "1"}
    end
    it "should select the search_director template for rendering" do
      Movie.stub(:search_director).and_return(@fake_results)
      get :search_director, {:id => "1"}
      expect(response).to render_template('search_director')
    end
    it "should make search results available to that template" do
      Movie.stub(:search_director).and_return(@fake_results)
      get :search_director, {:id => "1"}
      expect(assigns(:movies)).to eq(@fake_results)
    end
 end
end