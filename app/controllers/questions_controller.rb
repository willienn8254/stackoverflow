# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
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
		@question.user=current_user

		if @question.save

			redirect_to questions_path, notice: "La pregunta fue publicada con exito"

		else

			render :new

		end

	end

	def show

		@question=Question.find(params[:id])
		@comments=@question.comments


	end


	def edit

		@question=Question.find(params[:id])

	end

	def update

		@question=Question.find(params[:id])

		if @question.update(question_params)

			redirect_to questions_path, notice: "La pregunta fue actualizada con exito"


		else

			render :edit

		end



	end


	def destroy

		@question=Question.find(params[:id])

		@question.destroy

		redirect_to posts_path, notice: "la pregunta fue eliminada"

		

	end






	private

	def question_params

		params.require(:question).permit(:title, :body)

	end

end
