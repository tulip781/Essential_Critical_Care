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
    sorted = resources.sort_by(&:created_at).reverse
    sorted.sort do |a, b|
      if b.pinned? && a.pinned?
        0
      elsif b.pinned? == false && a.pinned?
        -1
      elsif b.pinned? && a.pinned? == false
        1
      elsif b.pinned? == false && a.pinned? == false
        0
      end
    end
  end

end
