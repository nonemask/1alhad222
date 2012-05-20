class Role < ActiveRecord::Base
 has_many :adids
 has_many :users , through: :adids
end
