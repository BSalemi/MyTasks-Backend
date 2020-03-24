class User < ApplicationRecord
    validates(:username, :presence => true, :uniqueness => true)
    validates(:email_address, :presence => true, :uniqueness => true)
    validates(:password, :presence => true)

    has_many :tasks 
end
