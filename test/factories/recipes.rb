# association(:user) method to make sure that every recipe we create has an associated User object.
FactoryGirl.define do
  factory :recipe do
    #name "Mom's Spaghetti"
    #description "The best pasta in the world."
    # Putting the Faker portions in a block (the { ... }) it means that every
    #   time FactoryGirl generates a recipe it will call those methods again.
    name {Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
    association(:user)
  end
end
