class DemoSchedulerJob < ApplicationJob
  def perform
    User.where(notify:true).each do|user|
      UserMailMailer.submission(user.email).deliver
    end
  end
end
