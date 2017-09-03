class Meal < ApplicationRecord
  # the inverse is there so that when :meals is created - it hooks back up to the parent
  # belongs_to :meal, inverse_of: :meals
  belongs_to :meal_plan, inverse_of: :meals
  belongs_to :recipe

  validates :date, presence: true
  validates :meal_plan, presence: true
  validates :recipe, presence: true
end
