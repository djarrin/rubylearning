class ArticlesController < ApplicationController
	#will allow access to the David user to see the show and index page
	http_basic_authenticate_with name: "David", password: "secret", except: [:index, :show]

	#and index action to show all of the articles in the db, index actions (and there assiciated views) will be the first thing that shows up when you enter a particular directory. Note, when showing multiple records of a class the class must be plural
	def index
		@articles = Article.all
	end

	#This action is used to show a new article that has been created. the Article.find method finds the associated pram id and associates it back to the article object
	def show
		@article = Article.find(params[:id])
	end

	#this is an action, it can be auto generated with the generate command
	def new
		@article = Article.new
	end

	#is the action responsible for editing exsisting articles
	def edit
		@article = Article.find(params[:id])
	end
	#this action is used to create a new article when the form is submitted
	def create
		#This command will display what is being submitted to the DB
		#render plain: params[:article].inspect

		#This will map all the params of article to the appropriate columns in the article table, note class names must be capitalized, hints the capital A, passing in "articles_params" so we can re-use what should be passed to the db
		@article = Article.new(article_params)

		#savies the new article to the db
		if @article.save
			redirect_to @article
		else
			#will render the new action, which has saved the instance variable @article, so that when you return to the page, all the information that was saved on it remains on the page
			render 'new'
		end
		#redirects to show the user what they have just submitted
		#redirect_to @article
	end

	#this action finds the article in question then once update is pressed and passes all validation it will update the article, otherwise it will render the instance vaiable article with on the edit action
	def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end

	#this action will "destroy" a record from the db
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	#this private method tells RoR what parameters are allowed to be submited
	private
		def article_params
		    params.require(:article).permit(:title, :text)
		end
end
