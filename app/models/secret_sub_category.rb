class SecretSubCategory < ApplicationRecord
  belongs_to :secret_category
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
  accepts_nested_attributes_for :secret_category
  translates :title, :description, :fallbacks_for_empty_translations => true
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]

  def create_resources
    sorted = (self.pdfs.with_attached_document + self.videos + self.infographics.with_attached_photo).sort_by(&:created_at).reverse
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
