ActiveAdmin.register Pdf do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?, :file
  form do |f|
    f.inputs "Upload the PDF you want" do
      f.input "file", label: "PDF upload", as: :file, input_html: { direct_upload: true }
    end
    f.semantic_errors # shows errors on :base
    f.inputs "What language is your PDF?" do
      f.input :english?, label: "Check this box if your PDF is English"
    end
    f.inputs "Select One of these to attach PDF to" do
      f.input :sub_category
      f.input :category
      f.input :secret_sub_category
      f.input :secret_category
    end
    f.inputs "Would you like to pin PDF as important in the attatched Category. This will make it appear near the top of the list." do
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
