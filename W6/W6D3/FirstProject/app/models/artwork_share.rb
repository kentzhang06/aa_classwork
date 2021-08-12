class ArtworkShare < ApplicationRecord
    validates :artwork_id, uniqueness: { scope: :viewer_id, message: "An user cannot have a single Artwork shared with them more than once"}, presence: true

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork
    

end