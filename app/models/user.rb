class User < ApplicationRecord
    has_secure_password

    has_many :tasks,dependent: :destroy

    def welcome
        "Hello, #{self.email}!"
    end

    validates :name ,:mobileno,:address,:city,:pincode,:state,:email,:password, presence: true,on: :create
    validates :email , format: { with: /\A(\S+)@(.+)\.(\S+)\z/, message: "Email invalid"  },
    uniqueness: { case_sensitive: false },
    length: { minimum: 4, maximum: 254 },on: :create
    validates :address,length: { minimum: 4, maximum: 254 },on: :create
end
