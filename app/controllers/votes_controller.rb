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

class VotesController < ApplicationController

		

	def create

		@votable= find_votable
		@vote = @votable.votes.create(user: current_user)
     		if @vote.save
	     			flash[:notice] = "vote created comment."

         	if params[:answer_id]
              		answer= Answer.find(params[:answer_id])
              		question= Question.find(answer.question_id)
    	        	redirect_to question

          	elsif  params[:question_id]
            		question= Question.find(params[:question_id])
            		redirect_to question



          	end



			  else
			  	flash[:notice] = "malll."
			    


			  end
		
	end



	def destroy

		@votable= find_votable
		@votable.votes.where(user: current_user).take.try(:destroy)
     		
         	if params[:answer_id]
              		answer= Answer.find(params[:answer_id])
              		question= Question.find(answer.question_id)
    	        	redirect_to question

          	elsif  params[:question_id]
            		question= Question.find(params[:question_id])
            		redirect_to question



			  else
			  	flash[:notice] = "malll."
			    


			  end
		




	end


	def find_votable

		params.each do |name, value|
		  if name =~ /(.+)_id$/
		    return $1.classify.constantize.find(value)
		  end
		end
		nil

	end


	 private

    def vote_params
      params.require(:vote).permit(:votable_type, :votable_id).merge(user: current_user)
    end






end
