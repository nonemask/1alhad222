# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
    has_many :adids
   has_many :feeds
    has_many :microposts , through: :feeds,:dependent => :destroy
    has_many :roles , through: :adids
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: valid_email_regex },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true ,:length       => { :within => 6..40 }
   # The following methods are needed to be minimally implemented
   def feedz
  microposts
end
 private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
