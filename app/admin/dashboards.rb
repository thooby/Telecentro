ActiveAdmin::Dashboards.build do
  section "Statistics" do
    div :class => "attributes_table" do
      table do
        tr do
          th "Número de ventas del día"
          td number_with_delimiter(Ventum.this_day.count)
        end
    
        tr do
          th "Ingresos del día"
          td number_with_delimiter(Ventum.this_day.all.sum(&:monto)), :style => "font-weight: bold;"
        end
        tr do
          th "Número de ventas de ayer"
          td number_with_delimiter(Ventum.this_yesterday.count)
        end
    
        tr do
          th "Ingresos de ayer"
          td number_with_delimiter(Ventum.this_yesterday.all.sum(&:monto)), :style => "font-weight: bold;"
        end
        tr do
          th "Número de ventas del mes"
          td number_with_delimiter(Ventum.this_month.count)
        end
    
        tr do
          th "Ingresos del mes"
          td number_with_delimiter(Ventum.this_month.all.sum(&:monto)), :style => "font-weight: bold;"
        end
    
      end
    end
  end
    section "Ultimas ventas" do
      ul do
        Ventum.limit(5).order("fecha DESC").collect do |ventum|
          li link_to(ventum.persona.name, admin_ventum_path(ventum))
        end
      end
    end
  
  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
