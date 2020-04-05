class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
  translates :title, :description
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]
end
