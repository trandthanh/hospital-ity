class Photo < ApplicationRecord
  belongs_to :flat

  validates :room, inclusion: { in: ["séjour", "salle de bain", "chambre", "cuisine"] }

  mount_uploader :url, UrlUploader
end
