class Shere < ActiveRecord::Base
  belongs_to :studio
     attr_accessible :image
  has_attached_file :image,:url => '/assets/img/:id/:style.:extension',
                    :path => ':rails_root/app/assets/images/img/:id/:style.:extension',
    :styles => {
      :thumb=> "80x80#",
      :small  => "150x150>", 
 }
end
