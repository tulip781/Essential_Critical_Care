class Category < ApplicationRecord
  belongs_to :navbar_base_folder
  has_many :sub_categories, dependent: :destroy
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy
  accepts_nested_attributes_for :navbar_base_folder

  validates :title, presence: true
  validates :description, presence: true

  translates :title, :description, :fallbacks_for_empty_translations => true
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]

  def create_resources
    sorted = (self.pdfs.with_attached_document + self.videos + self.infographics.with_attached_photo).sort_by(&:created_at).reverse
    sorted_with_pins = sorted.sort do |a, b|
      if b.pinned? == false && a.pinned?
        -1
      elsif b.pinned? && a.pinned? == false
        1
      else
        0
      end
    end
    if I18n.locale == :en
      sorted_with_pins.select { |attachment| attachment.english? || attachment.both_languages? }
    elsif I18n.locale == :lo
      sorted_with_pins.select { |attachment| attachment.lao? || attachment.both_languages? }
    else
      sorted_with_pins
    end
  end

end
