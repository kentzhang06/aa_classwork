class Bench < ApplicationRecord
  validates_presence_of :description, :lat, :lng

  def self.in_bounds(bounds)
    # google map bounds will be in the following format:
    # {
    #   "northEast"=> {"lat"=>"37.80971", "lng"=>"-122.39208"},
    #   "southWest"=> {"lat"=>"37.74187", "lng"=>"-122.47791"}
    # }
    #... query logic goes here
    {
      "northEast"=> {"lat"=>"37.80971", "lng"=>"-122.39208"},
      "southWest"=> {"lat"=>"37.74187", "lng"=>"-122.47791"}
    }
    end
end
