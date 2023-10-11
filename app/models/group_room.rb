class GroupRoom < ApplicationRecord
  
  has_many :group_entries, dependent: :destroy
  has_many :group_chats, dependent: :destroy
  has_many :users, through: :group_entries, dependent: :destroy
  
end
