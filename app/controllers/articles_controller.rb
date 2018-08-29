class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update]

  def new
    @article = Article.new
  end

  def create
    # POST /articles
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.author = current_user.full_name
    if @article.save
      p "article saved!"
      redirect_to @article
    else
      p 'Article rejected for errors'
      p @article.errors.messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      p "article successfully updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    # GET /articles
    @articles = Article.all.order('CREATED_AT DESC')
  end

  def search

  end

 def results
   @results = params[:q]
   p params[:date_submitted]
   if params[:terms].to_i != 1
     p 'User did not agree :/'
     render 'search'
   end
   search_words = params[:q].downcase.split(' ')
   titles = Article.pluck(:title)
   matches = []
   @final_results = []
   search_words.each do |word|
     titles.each do |t|
       if t.downcase.include?(word)
         matches << t
       end
     end
   end
   matches.each do |match| #2
       x = Article.where(title: match) #2
       x.each do |y|
         @final_results << y
       end
   end
   @final_results
 end

  private

  def article_params
    params.require(:article).permit(:title, :author, :content, :cover_photo)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
