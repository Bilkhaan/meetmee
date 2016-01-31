module ApplicationHelper
  def set_referrer(params)
    return "people" if params[:action] == 'dashboard' && params[:id].present?
    return "edit" if params[:controller].in? ["profiles", "portfolios"]
    return "loginForm" if params[:controller].in? ["devise/registrations", "devise/sessions"]
    return "viewProfile" if params[:controller] == "homes"
  end

  def apply_container_class(params)
    return "container clearfix margin-container" unless params[:action].in?(["dashboard", "user_profile"])
  end

  def flash_class(flash_type)
    case flash_type
      when :success
        "alert alert-success"
      when :notice
        "alert alert-success"
      when :alert
        "alert alert-danger"
    end
  end
end
