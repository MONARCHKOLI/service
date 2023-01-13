class User < ApplicationRecord
    has_secure_password

    has_many :tasks,dependent: :destroy

    def welcome
        "Hello, #{self.email}!"
    end

end
