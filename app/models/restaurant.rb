class Restaurant < ApplicationRecord
  mount_uploader :coverphoto, CoverphotoUploader

  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :customers,
             :through => :reviews,
             :source => :customer

  # Validations

end
