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

class AnswersController < ApplicationController

	
  def create
  question= Question.find(params[:question_id])
  question.answers.create(answers_params)

  redirect_to question
	end

private
  def answers_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end

end
