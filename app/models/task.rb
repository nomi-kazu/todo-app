# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  deadline   :date             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :bigint
#  user_id    :bigint           not null
#
class Task < ApplicationRecord
	belongs_to :board
	belongs_to :user

	def author_name
		user.display_name
	end
end
