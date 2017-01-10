class Review < ApplicationRecord
  mount_uploader :photos, PhotoUploader

  # Direct associations

  belongs_to :restaurant

  belongs_to :customer

  # Indirect associations

  # Validations

end
