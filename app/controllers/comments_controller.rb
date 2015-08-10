class CommentsController < ApplicationController
	#will allow the David User to destory comments
	http_basic_authenticate_with name: "David", password: "secret", only: :destroy

	def create
		#finds all the article id that will associate to the newly created comment
		@article = Article.find(params[:article_id])
		#creates a comment and associates it with the article
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end
	#will find the article you are focused on, then find the asscoiated comment you are trying to delete, delete it then redirect you to the articles show page
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end
end
