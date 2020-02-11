class Website < ActiveRecord::Base
  has_many :users
  has_many :users, through: :accounts
end
