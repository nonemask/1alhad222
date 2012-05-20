class Aset < ActiveRecord::Base
  belongs_to :sound
  belongs_to :list
    attr_accessible :image
validates_attachment_content_type :music,
  :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
   validates_attachment_size :music, :less_than => 10.megabytes                                    
  has_attached_file :image,     :url => '/assets/:id/:style.:extension',
                    :path => ':rails_root/app/assets/images/:id/:style.:extension',
    :styles => {
      :thumb=> "80x80#",
      :small  => "150x150>", 
 }
end
