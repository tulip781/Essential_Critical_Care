class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
end
