# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class QuestionsController < ApplicationController


	def index

		@questions=Question.all

	end


	def new

		@question=Question.new

	end


	def create

		@question=Question.new(question_params)

		if @question.save

			redirect_to questions_path, notice: "La pregunta fue publicada con exito"

		else

			render :new

		end

	end






	private

	def question_params

		params.require(:question).permit(:title, :body)

	end

end
