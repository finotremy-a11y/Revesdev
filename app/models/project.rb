class Project < ApplicationRecord
  has_one_attached :cover_image

  validates :title, presence: true
  validates :description, presence: true

  scope :featured, -> { where(featured: true).order(position: :asc) }
  scope :ordered, -> { order(position: :asc) }
end
