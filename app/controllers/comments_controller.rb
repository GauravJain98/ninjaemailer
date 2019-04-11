class CommentsController < ApplicationController
  # before_login :require_login
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @admin = Admin.find_by(user_id:current_user.id)
    @agent = Agent.find_by(user_id:current_user.id)
    comment_params[:sender] = false
    @comment = @ticket.comments.create(comment_params)
    @comment.sender = true
    @comment.save
    redirect_to ticket_path(@ticket)
  end
 
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :sender, :ticket)
    end
end
