class Restaurant < ApplicationRecord
  mount_uploader :coverphoto, CoverphotoUploader

  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
