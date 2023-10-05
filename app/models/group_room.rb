class GroupRoom < ApplicationRecord
  belongs_to :user
  
  has_many :group_entries, dependent: :destroy
  has_many :group_chats, dependent: :destroy
  
end
