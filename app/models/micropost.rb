class Micropost < ActiveRecord::Base
   attr_accessible :content , :name
   has_many :feeds
 has_many :users , through: :feeds ,  :foreign_key => "user_id"
 
      validates :name, :presence => true, :length => { :maximum => 140 }
  default_scope order: 'microposts.created_at DESC'
 validates :content, :presence => true, :length => { :maximum => 1400 }
end
