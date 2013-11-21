class User < ActiveRecord::Base
  has_and_belongs_to_many :meetings
  has_and_belongs_to_many :lectures
  has_many :applications
end
