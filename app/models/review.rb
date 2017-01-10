class Review < ApplicationRecord
  mount_uploader :photos, PhotoUploader

  # Direct associations

  belongs_to :reviewer,
             :counter_cache => true

  belongs_to :restaurant,
             :counter_cache => true

  # Indirect associations

  # Validations

end
