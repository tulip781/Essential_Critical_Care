ActiveAdmin.register SubCategory do

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
  #
  # permit_params do
  #   permitted = [:category_id, :title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
