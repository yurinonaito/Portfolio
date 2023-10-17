class Room < ApplicationRecord
  belongs_to :user_a, class_name: "User"
  belongs_to :user_, class_name: "User"
  
  has_many :entries, dependent: :destroy
  has_many :chats, dependent: :destroy
  
end
