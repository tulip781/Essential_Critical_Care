ActiveAdmin.register SecretSubCategory do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :secret_category_id, :title, :description
  permit_params *SecretSubCategory.globalize_attribute_names

  form do |f|
  f.semantic_errors # shows errors on :base
  f.inputs          # builds an input field for every attribute
  I18n.available_locales.each do |locale|
    f.inputs " #{locale == :en ? 'Secret Sub Category - English Translation ' : 'Secret Sub Category - Laos Translation'}" do
      f.input "title_#{locale}", label: "Secret Sub Category Title - #{locale}"
      f.input "description_#{locale}", as: :text, label: "Secret Sub Category Description - #{locale}"
    end
  end
  f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  # permit_params do
  #   permitted = [:secret_category_id, :title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
