class StaticPagesController < ApplicationController
  def home
  end
  
  def my
    @plans = current_user.plans
  end
end
