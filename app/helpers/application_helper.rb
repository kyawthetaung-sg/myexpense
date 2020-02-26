module ApplicationHelper
  include Pagy::Frontend

  def full_language(lang_id)
      if lang_id == 2
          language_name = "日本語 (Japanese)"
      else
          language_name = "英語 (English)"
      end
  end

  def setting_links
      options = [
          {path: themes_path, label: t("menu_sidebar.theme")},
          {path: settings_path, label: t("menu_sidebar.setting")}
      ]
      navigation_dropdown_link(t("menu_sidebar.setting"), "fas fa-sliders-h", options)
  end

  def navigation_dropdown_link(label = "", icon_class = "", options = {})
      condition = options.any? do |option|
        option[:path] && option[:path] != "#" && !(request.path !~ Regexp.new("^#{option[:path]}"))
      end

      html = <<-EOT
      <li class="#{condition ? 'dropdown open' : 'dropright' }">
        <a href="##{ label.delete(' ') }" data-toggle="collapse" aria-expanded="#{condition ? 'true' : 'false' }" class="dropdown-toggle">
          <i class="#{ icon_class }"></i>#{ label }
        </a>
        <ul class="collapse list-unstyled #{condition ? 'show' : '' }" id="#{ label.delete(' ') }">
        #{
          options.map{|option|
            navigation_dropdown_option(option[:condition], option[:path] || "#", option[:icon_class], option[:label])
          }.join
        }
        </ul>
      </li>
      EOT
      html.html_safe
  end

  def navigation_dropdown_option(condition, path = "#", icon_class = "", label = "")
      condition = true if condition == nil
      return unless condition
      content_tag(:li, class: request.path !~ Regexp.new("^#{path}") ? '' : 'active ffrfr') do
        link_to path do
          "<i class='#{icon_class}'></i> #{label}".html_safe
        end
      end
  end
end
