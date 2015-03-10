class Patient < ActiveRecord::Base
  has_many :locations
  has_many :doctors, through: :locations
end
