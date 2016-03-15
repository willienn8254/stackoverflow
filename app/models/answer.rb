# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#  user_id     :integer
#

class Answer < ActiveRecord::Base
	
	belongs_to :question
	belongs_to :user
	has_many :votes, :as => :votable

	
	
end
