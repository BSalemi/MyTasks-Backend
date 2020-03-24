class User < ApplicationRecord
    validates(:username, :presence => true, :uniqueness => true)
    validates(:email_address, :presence => true, :uniqueness => true)
    validates(:password, :presence => true)

    validates_confirmation_of :password, :message => "Passwords do not match"
        
    validates_presence_of :password_confirmation

    has_many :tasks
end
