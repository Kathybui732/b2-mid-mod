require "rails_helper"

RSpec.describe "Actor Show Page" do
	before :each do
    @studio_1 = Studio.create(name: "Studio 1")
    @movie_1 = @studio_1.movies.create(title: "Weathering With You", creation_year: 2019, genre: "Anime")
    @movie_2 = @studio_1.movies.create(title: "Your Name", creation_year: 2011, genre: "Anime")
    @actor_1 = Actor.create(name: "Actor 1", age: 25)
    @actor_2 = Actor.create(name: "Actor 2", age: 20)
    @actor_3 = Actor.create(name: "Actor 3", age: 30)
    MovieActor.create(movie: @movie_1, actor: @actor_1)
    MovieActor.create(movie: @movie_1, actor: @actor_2)
    MovieActor.create(movie: @movie_1, actor: @actor_3)
    MovieActor.create(movie: @movie_2, actor: @actor_2)
    MovieActor.create(movie: @movie_2, actor: @actor_3)
	end

  it "displays all actors attributes" do
    visit "/actors/#{@actor_1.id}"
    expect(page).to have_content("#{@actor_1.name}")
    expect(page).to have_content("#{@actor_1.age}")
  end

  # it "displays a unique list of all of the actors this particular actor has worked with" do
  #   visit "/actors/#{@actor_1.id}"
  #   expect(page).to have_content("#{@actor_2.name}")
  #   expect(page).to have_content("#{@actor_3.name}")
  #
  #   visit "/actors/#{@actor_2.id}"
  #   expect(page).to have_content("#{@actor_1.name}")
  #   expect(page).to have_content("#{@actor_3.name}")
  #   expect(page).to have_content("#{@actor_4.name}")
  #
  #   visit "/actors/#{@actor_3.id}"
  #   expect(page).to have_content("#{@actor_2.name}")
  #   expect(page).to have_content("#{@actor_1.name}")
  # end
end
