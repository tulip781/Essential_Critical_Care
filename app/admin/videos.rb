ActiveAdmin.register Video do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :url, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs "Upload the Url Vimeo you want" do
      f.input :title
      f.input :url, label: "Paste The Vimeo Link Here"
    end
    f.inputs "What language is your Video?" do
      f.input :english?, label: "Check this box if your Video is English"
    end
    f.inputs "Select One of these to attach Video to" do
      f.input :sub_category
      f.input :category
      f.input :secret_sub_category
      f.input :secret_category
    end
    f.inputs "Would you like to pin Video as important in the attatched Category. This will make it appear near the top of the list." do
      f.input :pinned?, label: "Check this box if you want to pin this Video"
    end
    f.actions
  end
  # or
  #
  # permit_params do
  #   permitted = [:title, :url, :sub_category_id, :category_id, :secret_category_id, :secret_sub_category_id, :english?, :pinned?]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
