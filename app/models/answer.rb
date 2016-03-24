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
	has_many :comments, :as => :commentable
	has_many :votes, :as => :votable

	validates :body, presence: true

	def voted_by?(user)
	  votes.exists?(user: user)
	end

	
	
end
