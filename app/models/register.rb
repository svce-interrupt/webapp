class Register < ApplicationRecord

	before_save{ self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
				format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    validates :password, presence: true, length: {minimum: 6}  

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
    validates :college_name, presence: true

                

end
