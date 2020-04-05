class SecretSubCategory < ApplicationRecord
  belongs_to :secret_category
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
end
