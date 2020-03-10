require 'rails_helper'

RSpec.describe MoviesController do
  describe "Find similar movies with same director" do
    let(:movie1) {Movie.create!(director: "Ridley Scott")}
    let(:movie2) {Movie.create!(director: "George Lucas")}
    let(:movie3) {Movie.create!(director: "Ridley Scott")}
    let(:movie4) {Movie.create!(director: "Ridley Scott")}
    let(:movie5) {Movie.create!(director: "George Lucas")}
    let(:movie6) {Movie.create!(director: "")}
    let(:movie7) {Movie.create!(director: "Director")}
    
    it "Found the movies with same directory" do
        get :find_movies_with_same_directors,  {movie_id: movie1.id}
        assigns(:movies_with_same_directors).each do |movie|
           expect(movie.director).to eq(movie1.director) 
        end
    end
    
  end
end