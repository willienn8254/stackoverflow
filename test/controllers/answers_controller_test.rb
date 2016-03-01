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

require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
