class Sound < ActiveRecord::Base
  has_many :asets
   has_many :lists
  attr_accessible :content , :name,:asets_attributes
  accepts_nested_attributes_for :asets , :allow_destroy=>true
  
   validates :name, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 50 }
end
