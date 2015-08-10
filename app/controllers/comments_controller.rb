class CommentsController < ApplicationController
	def create
		#finds all the article id that will associate to the newly created comment
		@article = Article.find(params[:article_id])
		#creates a comment and associates it with the article
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
