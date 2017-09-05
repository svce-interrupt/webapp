class Event < ApplicationRecord
	#association from users.
	belongs_to :user

	validates :user_id, presence: true



end
