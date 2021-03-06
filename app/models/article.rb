class Article < ActiveRecord::Base
  belongs_to :category,inverse_of: :article
  has_many :comment,inverse_of: :article
  validates :title,:content, presence: true

  scope :keyword, -> (keyword) { where('title like ?', "%#{keyword}%") }
end