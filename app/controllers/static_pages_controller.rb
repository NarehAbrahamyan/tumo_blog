class StaticPagesController < ApplicationController
  def home
     if user_signed_in? 
    @user=User.find(current_user.id)
     end
  end

  def help
  end
end
