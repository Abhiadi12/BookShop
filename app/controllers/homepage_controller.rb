class HomepageController < ApplicationController
  def home
  end
  def profile
    @author = Author.first
  end
end
