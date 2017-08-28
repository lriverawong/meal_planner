require "test_helper"

describe Meal do
  describe "validity" do
    let(:meal) { Meal.new }

    before do
      meal.valid?
    end

    it "requires a date" do
      meal.errors[:date].must_include "can't be blank"
    end

    it "requires an meal_plan" do
      meal.errors[:meal_plan].must_include "can't be blank"
    end
  end
end
