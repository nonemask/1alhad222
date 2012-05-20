class Studio < ActiveRecord::Base
   has_many :sheres
   belongs_to :studionames
   attr_accessible  :name,:asetts_attributes,:subject
  accepts_nested_attributes_for :sheres , :allow_destroy=>true
     

   validates :name, presence: true, length: { maximum: 50 }
end
