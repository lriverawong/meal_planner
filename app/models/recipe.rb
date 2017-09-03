class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :user, presence: true

  def recipe_options
    recipes.map do |recipe|
      [recipe.name, recipe.id]
    end
  end

  def to_s
    name
  end
end
