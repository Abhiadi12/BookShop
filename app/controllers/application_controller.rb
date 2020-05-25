class ApplicationController < ActionController::Base
  include Pundit
  before_action :set_last_seen_at, if: proc { user_signed_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 3.minutes.ago) }
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def render_404
    render file: 'public/404.html', status: 404
  end

  def user_not_authorized
    redirect_back fallback_location: root_path , alert: "You are't authorize to perform this operation"
  end
  private
  def set_last_seen_at
    current_user.update_column(:last_seen_at, Time.zone.now)
  end
end
