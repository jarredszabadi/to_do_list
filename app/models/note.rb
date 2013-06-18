class Note < ActiveRecord::Base
	belongs_to :user, class_name: "User"
    attr_accessible :text, :assigned
	validates :user_id, presence: true
	validates :text, presence: true
	#validates :assigned, presence: true
end
