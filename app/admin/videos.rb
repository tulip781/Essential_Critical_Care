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
      f.input :url, label: "Paste The Vimeo Link Here"
    end
    I18n.available_locales.each do |locale|
      f.inputs " #{locale == :en ? 'Video - English Translation ' : 'Video - Laos Translation'}" do
        f.input "title_#{locale}", label: "#{locale == :en ? 'Video Title - English Translation ' : 'Video Title - Laos Translation'}"
      end
    end
    f.inputs "What language is your Video?" do
      f.input :english?, label: "Keep this box checked if your video is English"
    end
    f.inputs "Select one category of these to attach Video to. You must only choose one of these four." do
      f.input :category
      f.input :sub_category, label: "Sub Categories"
      f.input :secret_category, label: "Secret Category"
      f.input :secret_sub_category, label: "Secret Sub Category"
    end
    f.inputs "Would you like to pin Video as important in the attatched Category. This will make it appear near the top of the list. List sorted by date added otherwise." do
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
