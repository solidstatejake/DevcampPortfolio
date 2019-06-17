module ApplicationHelper

  def login_helper style=""
    if current_user.is_a? GuestUser
      (link_to 'Sign Up', new_user_registration_path, class: style) +
      (link_to 'Login', new_user_session_path, class: style)
    else
      link_to 'Logout', destroy_user_session_path, method: :delete,  class: style
    end
  end

  def source_helper
    unless session[:source].nil?
      greeting = "Thanks for visiting me from #{session[:source].titleize}!"
      content_tag(:p, greeting)
    end
  end

  def copyright_generator
    SolidStateViewTool::Renderer.copyright 'Jacob Berg', "It's mine, bitch."
  end
end
