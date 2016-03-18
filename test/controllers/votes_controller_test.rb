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

require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
