class MealPlan < ApplicationRecord
  belongs_to :user
  # the inverse is there so that when :meals is created - it hooks back up to the parent
  has_many :meals, -> { order(:date) }, inverse_of: :meal_plan, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :meals

  def build_meals
    # returns array of just the recipe ids that a user is associated with
    user_recipe_ids = user.recipes.pluck(:id)
    # inclusive range
    (start_date..end_date).each do |date|
      # looks for every meal we already have built and finds recipe id
      # (everything we have) - (everything we have used)
      unused_recipe_ids = user_recipe_ids - meals.map(&:recipe_id)

      if unused_recipe_ids.empty?
        available_recipe_ids = user_recipe_ids
      else
        available_recipe_ids = unused_recipe_ids
      end
      # sample just gives us a random recipe_id
      # although if not enough meals for all the days there is the possiblity that we
      #   sample pick the same one from the complete list
      meals.build(date: date, recipe_id: available_recipe_ids.sample)
    end
  end

  def to_s
    "#{start_date} - #{end_date}"
  end

end
