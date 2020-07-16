# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    @studio_1 = Studio.create(name: "Studio 1")
    @studio_2 = Studio.create(name: "Studio 2")
    @movie_1 = @studio_1.movies.create(title: "Weathering With You", creation_year: 2019, genre: "Anime")
    @movie_2 = @studio_1.movies.create(title: "Your Name", creation_year: 2011, genre: "Anime")
    @movie_3 = @studio_2.movies.create(title: "A Silent Voice", creation_year: 2014, genre: "Anime")
    @actor_1 = Actor.create(name: "Actor 1", age: 25)
    @actor_2 = Actor.create(name: "Actor 2", age: 20)
    @actor_3 = Actor.create(name: "Actor 3", age: 30)
    @actor_4 = Actor.create(name: "Actor 3", age: 35)
    MovieActor.create(movie: @movie_1, actor: @actor_1)
    MovieActor.create(movie: @movie_1, actor: @actor_2)
    MovieActor.create(movie: @movie_2, actor: @actor_2)
    MovieActor.create(movie: @movie_2, actor: @actor_3)
    MovieActor.create(movie: @movie_3, actor: @actor_3)
    MovieActor.create(movie: @movie_3, actor: @actor_4)
