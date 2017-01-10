class Review < ApplicationRecord
  # Direct associations

  belongs_to :restaurant

  belongs_to :customer

  # Indirect associations

  # Validations

end
