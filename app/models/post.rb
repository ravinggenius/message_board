class Post < ApplicationRecord
  belongs_to :author, class_name: 'Identity'

  has_many :replies

  validates :author, presence: true

  validates :title, presence: true

  validates :body, presence: true

  scope :sorted, -> { order(published_at: :desc) }
end
