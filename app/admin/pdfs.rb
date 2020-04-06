ActiveAdmin.register Pdf do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params *Pdf.globalize_attribute_names, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?, :document
  form do |f|
    f.inputs "Upload the PDF you want" do
      f.input :document, label: "PDF upload", as: :file, input_html: { direct_upload: true }
    end
    f.semantic_errors # shows errors on :base
    I18n.available_locales.each do |locale|
      f.inputs " #{locale == :en ? 'English Translation ' : 'Laos Translation'}" do
        f.input "title_#{locale}", label: "#{locale == :en ? 'English PDF Title ' : 'Laos PDF Title'}"
      end
    end
    f.inputs "Select one Category to attach PDF to" do
      f.input :category, label: "Category"
      f.input :sub_category, label: "Sub Category"
      f.input :secret_category, label: "Secret Category"
      f.input :secret_sub_category, label: "Secret Sub Category"
    end
    f.inputs "What language is your PDF?" do
      f.input :english?, label: "Keep this box checked if your PDF is English"
    end
    f.inputs "Would you like to pin PDF as important in the attatched Category. This will make it appear near the top of the list. List sorted by date added otherwise." do
      f.input :pinned?, label: "Check this box if you want to pin this PDF"
    end
    f.actions
  end
  #
  # permit_params do
  #   permitted = [:title, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
