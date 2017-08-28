class RecipesController < ApplicationController
  before_action :require_login

  # made changes to only allow a user to edit their posts
  # "Recipe.all" became "current_user.recipes"
  # "Recipe.new" became "current_user.recipes.build"
  # "Recipe.find" became "current_user.recipes.find"

  def index
    @recipes = current_user.recipes.order(:id)
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "Deleted Recipe: #{recipe.name}"
  end

  def new
    #@recipe = Recipe.new
    @recipe = current_user.recipes.build
  end

  def create
    #@recipe = Recipe.new(recipe_params)
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Recipe Created!"
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe), notice: "Recipe Updated!"
    else
      @errors = @recipe.errors.full_messages
      render :edit
    end
  end

  private

  # Using a private method to encapsulate the permissible parameters is
  # a good pattern since you'll be able to reuse the same permit
  # list between create and update. Also, you can specialize this method
  # with per-user checking of permissible attributes.
  # Strong Parameters
  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end



end
