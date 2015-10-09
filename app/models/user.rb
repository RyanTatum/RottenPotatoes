class User < ActiveRecord::Base
    
    def User::create_user!(user)
        user[:session_token] = SecureRandom.base64
        self.create!(user)
    end
    
end