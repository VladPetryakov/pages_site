class Page < ApplicationRecord
  has_many :subpages, class_name: 'Page', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Page', optional: true

  validates :name, format: { with: /\A[a-zA-Z0-9_\p{Cyrillic}]+\z/, message: 'only allows letters' }
end
