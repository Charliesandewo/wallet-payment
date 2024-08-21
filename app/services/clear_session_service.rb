class ClearSessionService
  def self.execute(session:)
    session[:user_id] = nil
    session[:stock_id] = nil
    session[:team_id] = nil
  end
end
