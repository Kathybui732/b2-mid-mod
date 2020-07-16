class ActorsController < ApplicationController

  def create
    if Actor.exists?(name: "Actor 1")
      flash[:notice] = "Actor already exists"
      redirect_to "/movies/#{params[:movie_id]}"
    else
      new_actor = Actor.create(actor_params)
      if new_actor.save
        redirect_to "/movies/#{params[:movie_id]}"
      else
        flash[:error] = new_actor.errors.full_messages
      end
    end
  end

  def show
    @actor = Actor.find(params[:id])
  end

  private
  def actor_params
    params.permit(:name, :age)
  end
end
