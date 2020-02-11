class User < ActiveRecord::Base
  has_many :accounts
  has_many :websites, through: :accounts
end
