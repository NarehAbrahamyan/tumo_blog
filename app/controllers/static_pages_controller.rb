class StaticPagesController < ApplicationController
  def home
    @user=User.find(current_user.id)
  end

  def help
  end
end
