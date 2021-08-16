# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    COLORS = ['red', 'green', 'white', 'black', 'blue']

    validates_presence_of :birth_date, :color, :name, :sex, :description 
    validates :color, inclusion: {in: COLORS, message: "That's not a valid color"}
    validates :sex, inclusion: {in: ['M', 'F'], message: "Not a valid sex"}

    has_many :rental_requests,
      foreign_key: :cat_id,
      class_name: "CatRentalRequest"
end
