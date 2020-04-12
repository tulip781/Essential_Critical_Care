ActiveAdmin.register SubCategory do

  menu parent: "Public Resources"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :category_id, :title, :description
  #
  permit_params *SubCategory.globalize_attribute_names, :category_id

  form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs          # builds an input field for every attribute
  I18n.available_locales.each do |locale|
    f.inputs " #{locale == :en ? 'Sub Category - English Translation ' : 'Sub Category - Laos Translation'}" do
      f.input "title_#{locale}", label: "Sub Category Title - #{locale}"
      f.input "description_#{locale}", as: :text, label: "Sub Category Description - #{locale}"
    end
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  index do
    selectable_column
    column "Sub Category Title" do |folder|
      folder.title
    end
    column "Parent Category" do |folder|
      folder.category.title
    end
    column "Sub Category Description" do |folder|
      folder.description
    end
    column "Uploads Attached " do |folder|
      folder.pdfs.count + folder.videos.count + folder.infographics.count
    end
    column "PDFS Attached" do |folder|
      folder.pdfs.count
    end
    column "Videos Attached" do |folder|
      folder.videos.count
    end
    column "Infographics Attached" do |folder|
      folder.infographics.count
    end
    column :created_at
    actions
  end
end
