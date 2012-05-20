class Studioname < ActiveRecord::Base
  attr_accessible :content , :name,:asets_attributes
     has_many :studio

   validates :name, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 50 }
end
