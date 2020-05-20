class ApplicationController < ActionController::Base
  before_action :set_last_seen_at, if: proc { user_signed_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 3.minutes.ago) }
  def render_404
    render file: 'public/404.html', status: 404
  end
  private
  def set_last_seen_at
    current_user.update_column(:last_seen_at, Time.zone.now)
  end
end
