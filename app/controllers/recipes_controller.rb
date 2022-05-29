class RecipesController < ApplicationController
  def index
    @recipes = Recipe.preload(:ingredients).paginate(page: params[:page], per_page: 10).order('id DESC')
  end
end
