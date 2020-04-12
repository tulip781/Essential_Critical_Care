class Video < ApplicationRecord
  belongs_to :sub_category, optional: true
  belongs_to :category, optional: true
  belongs_to :secret_category, optional: true
  belongs_to :secret_sub_category, optional: true
  translates :title, :fallbacks_for_empty_translations => true
  globalize_accessors :locales => [:en, :lo], :attributes => [:title]

  validate :there_can_be_only_one
  validates :title, :url, presence: true
  validate :there_can_be_only_one_language

  before_create do
    self.url_code = self.url.split('https://vimeo.com/').last
  end

  private

  def there_can_be_only_one_language
    if english_count + lao_count + both_count != 1
      errors.add(:base, "You can only select one langauge preference for this Video")
    end
  end

  def english_count
    self.english? ? 1 : 0
  end

  def lao_count
    self.lao? ? 1 : 0
  end

  def both_count
    self.both_languages? ? 1 : 0
  end

  def there_can_be_only_one
    if category_count + secret_category_count + sub_category_count + secret_sub_category_count != 1
      errors.add(:base, "You can only attach this Video to one category")
    end
  end

  def category_count
    category.present? ? 1 : 0
  end

  def secret_category_count
    secret_category.present? ? 1 : 0
  end

  def sub_category_count
    sub_category.present? ? 1 : 0
  end

  def secret_sub_category_count
    secret_sub_category.present? ? 1 : 0
  end
end
