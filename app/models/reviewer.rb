class Reviewer < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
