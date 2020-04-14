class SecretNavbarBaseFolder < ApplicationRecord
  has_many :secret_categories, dependent: :destroy
  has_one_attached :banner
  translates :title, :description, :fallbacks_for_empty_translations => true
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]
  validates :title, presence: true
  validates :description, presence: true
  validates :banner, attached: true
end
