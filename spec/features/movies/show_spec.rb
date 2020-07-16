require "rails_helper"

RSpec.describe "Movie Show Page" do
	before :each do
    @studio_1 = Studio.create(name: "Studio 1")
    @movie_1 = @studio_1.movies.create(title: "Weathering With You", creation_year: 2019, genre: "Anime")
    @actor_1 = Actor.create(name: "Actor 1", age: 25)
    @actor_2 = Actor.create(name: "Actor 2", age: 20)
    MovieActor.create(movie: @movie_1, actor: @actor_1)
    MovieActor.create(movie: @movie_1, actor: @actor_2)
	end

  it "displays all the movie attributes" do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content("#{@movie_1.title}")
    expect(page).to have_content("#{@movie_1.creation_year}")
    expect(page).to have_content("#{@movie_1.genre}")
  end

  it "displays a list of all actors from youngest to oldest" do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content("#{@actor_2.name} #{@actor_1.name}")
  end

  it "displays the average age of all the movie's actors" do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content("Average Actor Age: 22.5")
  end

  it "displays a form for an actors name, but when filled with an existing actor's name it's redirected back to that movie's show page where the actor's name is listed" do
    visit "/movies/#{@movie_1.id}"
    expect(page).to have_content(@actor_1.name)
    fill_in :name, with: @actor_1.name
    click_on "Submit"
    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content("Actor already exists")
    expect(page).to have_content(@actor_1.name)
  end

  it "cannot create a new actor without all information" do
    visit "/movies/#{@movie_1.id}"
    fill_in :name, with: @actor_1.name
    click_on "Submit"
    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content("")
  end
end
