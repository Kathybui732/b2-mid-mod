require "rails_helper"

RSpec.describe "Studio index page" do
	before :each do
    @studio_1 = Studio.create(name: "Studio 1")
    @studio_2 = Studio.create(name: "Studio 2")
    @movie_1 = @studio_1.movies.create(title: "Weathering With You", creation_year: 2019, genre: "Anime")
    @movie_2 = @studio_1.movies.create(title: "Your Name", creation_year: 2011, genre: "Anime")
    @movie_3 = @studio_2.movies.create(title: "A Silent Voice", creation_year: 2014, genre: "Anime")
	end

  it "displays a list of all the movie studios with a list of all its movies" do
    visit "/studios"
    expect(page).to have_content("#{@studio_1.name}")
    expect(page).to have_content("#{@studio_2.name}")

    within(".movies-#{@studio_1.id}") do
      expect(page).to have_content("#{@movie_1.title}")
      expect(page).to have_content("#{@movie_2.title}")
    end

    within(".movies-#{@studio_2.id}") do
      expect(page).to have_content("#{@movie_3.title}")
    end
  end
end
