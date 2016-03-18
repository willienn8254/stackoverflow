# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  votable_id   :integer
#  votable_type :string
#  user_id      :integer
#

class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :votable, :polymorphic => true
	
end
