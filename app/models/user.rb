class User < ApplicationRecord
  # this includes validations such as email uniqueness
  include Clearance::User

  # provide User class with knowledge that it has recipes
  has_many :recipes
  has_many :meal_plans

  def recipe_options
    recipes.map do |recipe|
      [recipe.name, recipe.id]
    end
  end

end
