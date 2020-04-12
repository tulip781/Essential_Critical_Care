ActiveAdmin.register Category do

  menu parent: "Public Resources"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :has_subcategory, :navbar_base_folder_id, :title, :description
  permit_params *Category.globalize_attribute_names, :has_subcategory, :navbar_base_folder_id

  form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs          # builds an input field for every attribute
  I18n.available_locales.each do |locale|
    f.inputs " #{locale == :en ? 'Category - English Translation ' : 'Category - Laos Translation'}" do
      f.input "title_#{locale}", label: "Category Title - #{locale}"
      f.input "description_#{locale}", as: :text, label: "Category Description - #{locale}"
    end
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  # or
  index do
    selectable_column
    column "Category Title" do |folder|
      folder.title
    end
    column "Category Description" do |folder|
      folder.description
    end
    column "Parent Topic" do |folder|
      folder.navbar_base_folder.title
    end
    column "Number of Sub Categories attatched" do |folder|
      folder.sub_categories.count
    end
    column "Sub Categories Visible" do |folder|
      folder.has_subcategory
    end
    column "Uploads Attached if No Subcategory " do |folder|
      folder.pdfs.count + folder.videos.count + folder.infographics.count
    end
    column "PDFS Attached if No Subcategory" do |folder|
      folder.pdfs.count
    end
    column "Videos Attached if No Subcategory" do |folder|
      folder.videos.count
    end
    column "Infographics Attached if No Subcategory" do |folder|
      folder.infographics.count
    end
    column :created_at
    actions
  end
  #
  # permit_params do
  #   permitted = [:has_subcategory, :navbar_base_folder_id, :title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
