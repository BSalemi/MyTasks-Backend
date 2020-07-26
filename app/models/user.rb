class User < ApplicationRecord
    has_secure_password

    validates(:username, :presence => true, :uniqueness => true, :length => {:within => 6..12, :wrong_length => "Username must be between six and twelve characters long."} )
    
    validates(:email_address, :presence => true, :uniqueness => true)
    
    validates(:password, :presence => true,  :length => {:within => 8..16, :wrong_length => "Passwords must be between eight and sixteen characters long."})
    
    validates_presence_of :password_confirmation

    validates_confirmation_of :password, :message => "Passwords do not match"

    has_many :tasks
end
