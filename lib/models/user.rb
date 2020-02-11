class User < ActiveRecord::Base
  has_many :websites
  has_many :websites, through: :accounts
end
