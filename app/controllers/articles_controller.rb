class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource #cancan authorization
  # GET /articles
  # GET /articles.json
  def index
    add_breadcrumb "Articles",articles_path
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #binding.pry
    add_breadcrumb "Articles",articles_path
    cat=@article.category
    if cat
      cat.ancestors.reverse_each { |a| add_breadcrumb a.name,category_path(a) }
      add_breadcrumb cat.name,category_path(cat)
    end
    add_breadcrumb @article.title,article_path
    #ASK how to make this more DRY
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    #@article = current_user.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    #@article = current_user.articles.find(params[:id])
    authorize! :article_set_published, Article if params[:article][:published]
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    #@article = current_user.articles.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :category_id, :published, :bootsy_image_gallery_id)
    end
end
