class Category < ApplicationRecord
  belongs_to :navbar_base_folder
  has_many :sub_categories, dependent: :destroy
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
  accepts_nested_attributes_for :navbar_base_folder

  translates :title, :description
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]

  def create_resources
    sorted = (self.pdfs + self.videos + self.infographics).sort_by(&:created_at).reverse
    sorted.sort do |a, b|
      if b.pinned? == false && a.pinned?
        -1
      elsif b.pinned? && a.pinned? == false
        1
      else
        0
      end
    end
  end
end
