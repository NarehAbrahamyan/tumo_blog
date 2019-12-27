module UsersHelper 
    def avatar_image
        if @user.avatar.attached?
            @user.avatar
        else
            image_url("avatar.png")
        end
    end
    def currentuser_image
        if current_user.avatar.attached?
            current_user.avatar
        else
            image_url("avatar.png")
        end 
    end
end
