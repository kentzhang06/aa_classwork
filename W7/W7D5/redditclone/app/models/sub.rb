class Sub < ApplicationRecord
    validates :title, :description, :user_id, presence: true
    validates_uniqueness_of :title, {scope: :user_id}

    belongs_to :moderator,
        foreign_key: :user_id,
        class_name: "User"
end
