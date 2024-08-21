class ApplicationController < ActionController::Base
  helper_method :current_user,
                :current_team,
                :current_stock,
                :user_logged_in?,
                :team_logged_in?,
                :stock_logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_team
    @current_team ||= Team.find(session[:team_id]) if session[:team_id]
  end

  def current_stock
    @current_stock ||= Stock.find(session[:stock_id]) if session[:stock_id]
  end

  def user_logged_in?
    !current_user.nil?
  end

  def team_logged_in?
    !current_team.nil?
  end

  def stock_logged_in?
    !current_stock.nil?
  end

  def user_require_login
    return if user_logged_in?

    raise StandardError.new(
      message: "You must be logged in to access this section.",
      status:  401
    )
  end

  def team_require_login
    return if team_logged_in?

    raise StandardError.new(
      message: "You must be logged in to access this section.",
      status:  401
    )
  end

  def stock_require_login
    return if stock_logged_in?

    raise StandardError.new(
      message: "You must be logged in to access this section.",
      status:  401
    )
  end
end
