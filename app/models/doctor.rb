class Doctor < ActiveRecord::Base
  has_many :locations
  has_many :patients, through: :locations 
end
