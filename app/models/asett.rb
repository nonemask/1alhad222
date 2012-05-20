class Asett < ActiveRecord::Base
  belongs_to :list
  
  has_attached_file :music, 
    :url => '/assets/musics/:id/:style.:extension',
                    :path => ':rails_root/app/assets/audios/musics/:id/:style.:extension'
                
validates_attachment_presence :music
   validates :music, presence: true

  validates_attachment_content_type :music, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ],

                                    :message => 'file must be of filetype .mp3'

  validates_attachment_size :music, :less_than => 10.megabytes  
end
