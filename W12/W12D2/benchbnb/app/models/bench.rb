class Bench < ApplicationRecord
  validates_presence_of :description, :lat, :lng
end
