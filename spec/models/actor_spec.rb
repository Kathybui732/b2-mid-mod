require "rails_helper"

RSpec.describe Actor, type: :model do
	describe "validations" do
    it { should validate_presence_of :name }
		it { should validate_presence_of :age }
	end

	describe "relationships" do
		it { should have_many(:movies).through(:movie_actors) }
	end

	describe "methods" do
		before :each do
			@actor_1 = Actor.create(name: "Actor 1", age: 25)
			@actor_2 = Actor.create(name: "Actor 2", age: 20)
			@actor_3 = Actor.create(name: "Actor 3", age: 30)
			@actor_4 = Actor.create(name: "Actor 3", age: 35)
		end

		it "#average_age" do
			expect(Actor.average_age).to eq(27.50)
		end

		it "#sort_by_age" do
			actors_by_age = [@actor_2, @actor_1, @actor_3, @actor_4]
			expect(Actor.sort_by_age).to eq(actors_by_age)
		end
	end
end
