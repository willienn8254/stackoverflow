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
 answer= question.answers.create(answers_params)

 if answer.save

  redirect_to question, notice:"La respuesta se ha publicado con exito"

  else

		 redirect_to question, alert: "El contenido de la respuesta no puede ser vacio."

		end
	end

private
  def answers_params
    params.require(:answer).permit(:body).merge(user: current_user)
  end

end
