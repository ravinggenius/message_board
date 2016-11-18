class Reply < ApplicationRecord
  belongs_to :author, class_name: 'Identity'

  belongs_to :post

  validates :author, presence: true

  validates :body, presence: true

  validates :published_at, presence: true

  scope :sorted, -> { order(published_at: :asc) }
end
