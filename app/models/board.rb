# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#
class Board < ApplicationRecord
	validates :title, presence: true
	
	validates :content, presence: true
	validates :content, length: { minimum: 2}
	validates :content, uniqueness: true

	has_many :tasks
	belongs_to :user

	def author_name
		user.display_name
	end
end
