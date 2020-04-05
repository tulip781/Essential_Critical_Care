class SecretCategory < ApplicationRecord
  belongs_to :secret_navbar_base_folder
  has_many :infographics, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :pdfs, dependent: :destroy

  translates :title, :description
  globalize_accessors :locales => [:en, :lo], :attributes => [:title, :description]
end
