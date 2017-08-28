class User < ApplicationRecord
  # this includes validations such as email uniqueness
  include Clearance::User

end
