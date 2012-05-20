class List < ActiveRecord::Base
   has_many :asetts
   belongs_to :sounds
   attr_accessible  :name,:asetts_attributes
  accepts_nested_attributes_for :asetts , :allow_destroy=>true
     

   validates :name, presence: true, length: { maximum: 503333 }

end
