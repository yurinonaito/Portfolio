class Room < ApplicationRecord
  belongs_to :user
  
  has_many :entries, dependent: :destroy
  has_many :chats, dependent: :destroy
  
end
