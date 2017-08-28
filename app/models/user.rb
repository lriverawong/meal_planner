class User < ApplicationRecord
  # this includes validations such as email uniqueness
  include Clearance::User

  # provide User class with knowledge that it has recipes
  has_many :recipes

end
