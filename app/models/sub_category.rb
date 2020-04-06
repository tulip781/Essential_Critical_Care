class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
  translates :title, :description
  accepts_nested_attributes_for :category
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]

  def create_resources
    resources = []
    self.pdfs.each do |p|
      resources << p
    end
    self.videos.each do |v|
      resources << v
    end
    self.infographics.each do |i|
      resources << i
    end
    resources.sort_by(&:created_at).reverse
  end
end
