class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user
end
