class Todo < ApplicationRecord
  validates :done, inclusion: { in: [true, false] }
  validates_presence_of :title, :body
  validates_uniqueness_of :title, :body
end
