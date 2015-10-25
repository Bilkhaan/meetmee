module ApplicationHelper
  def set_referrer(params)
    return "edit" if params[:controller].in? ["profiles", "portfolios"]
    return "loginForm" if params[:controller].in? ["devise/registrations", "devise/sessions"]
    return "viewProfile" if params[:controller] == "homes"
  end

  def apply_container_class(params)
    return "container clearfix margin-container" unless params[:action] == "dashboard"
  end
end
