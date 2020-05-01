ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do




    columns do
      column do
        panel "Site Structure Map" do
          ul do
            NavbarBaseFolder.all.map do |n|
              h1 link_to(n.title , admin_topic_path(n))
              ul do
                n.categories.all.map do |c|
                  h3 link_to(c.title , admin_category_path(c))
                  ul do
                    c.sub_categories.all.map do |s|
                      h5 link_to( s.title , admin_sub_category_path(s))
                    end
                  end
                end
              end
            end
            SecretNavbarBaseFolder.all.map do |n|
              h1 link_to('hidden:' + n.title , admin_hidden_topic_path(n))
              ul do
                n.secret_categories.all.map do |c|
                  h3 link_to(c.title , admin_hidden_category_path(c))
                  ul do
                    c.secret_sub_categories.all.map do |s|
                      h5 link_to(s.title , admin_hidden_sub_category_path(s))
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
