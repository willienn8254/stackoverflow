# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string
#  user_id          :integer
#

class CommentsController < ApplicationController


def create

      @commentable = find_commentable
      @comment = @commentable.comments.create(comment_params)
     if @comment.save
	     flash[:notice] = "Successfully created comment."

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


  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

   private

    def comment_params
      params.require(:comment).permit(:body).merge(user: current_user)
    end

end
