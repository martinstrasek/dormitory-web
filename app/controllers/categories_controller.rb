class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  # GET /categories
  # GET /categories.json
  def index
    add_breadcrumb "Categories",categories_path
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    add_breadcrumb "Categories",categories_path
    @category.ancestors.reverse_each { |a| add_breadcrumb a.name,category_path(a) }
    add_breadcrumb @category.name,category_path
    @categories = Category.all
    @comment = Comment.new
  end

  # GET /categories/new
  def new
    add_breadcrumb "Categories",categories_path
    add_breadcrumb "New Category"
    @category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end

  # GET /categories/1/edit
  def edit
    add_breadcrumb "Categories",categories_path
    add_breadcrumb "Edit Category"
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
  
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :parent_id)
    end
end
