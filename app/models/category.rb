class Category < ApplicationRecord
  belongs_to :navbar_base_folder
  has_many :sub_categories, dependent: :destroy
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
end
