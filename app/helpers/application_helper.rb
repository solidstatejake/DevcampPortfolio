module ApplicationHelper

  def login_helper style = ""
    if current_user.is_a? GuestUser
      (link_to 'Sign Up', new_user_registration_path, class: style) +
      (' ') +
      (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper
    unless session[:source].nil?
      greeting = "Thanks for visiting me from #{session[:source].titleize}!"
      content_tag(:p, greeting)
    end
  end

  def sortable_permission_helper
    "sortable" if logged_in? :site_admin
  end

  def copyright_generator
    SolidStateViewTool::Renderer.copyright 'Jacob Berg', 'Made with Rails, Bootstrap, and love'
  end

  def nav_items
    [
    {
    url:   root_path,
    title: 'Home'
    },
    {
    url:   about_me_path,
    title: 'About'
    },
    {
    url:   contact_path,
    title: 'Contact'
    },
    {
    url:   blogs_path,
    title: 'Blog'
    },
    {
    url:   portfolios_path,
    title: 'Portfolio'
    }

    ]
  end

  def nav_helper tag_type, style
    nav_links = '';
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{is_active? item[:url]}'>#{item[:title]}</#{tag_type}>"

    end
    nav_links.html_safe
  end

  def is_active? path
    'active' if current_page? path
  end
end
