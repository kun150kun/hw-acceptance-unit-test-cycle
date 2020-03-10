require 'rails_helper'

RSpec.describe MoviesController do
  describe "The destination of find similar movies with same director" do
    let(:movie1) {Movie.create!(director: "Ridley Scott")}
    it "When the movies has a director" do
      expect(movie1.director).not_to eq(nil)
      expect(movie1.director).not_to eq("")
      get :find_movies_with_same_directors,  {movie_id: movie1.id}
      expect(response).to render_template(:find_movies_with_same_directors)
    end
    
    let(:movie2) {Movie.create!(director: "")}
    it "When the movies has no director" do
      expect(movie2.director).to eq("")
      get :find_movies_with_same_directors,  {movie_id: movie2.id}
      expect(response).to redirect_to(:action => :index)
    end
  end
end