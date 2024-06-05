class CategoriesController < ApplicationController
    before_action :require_admin,except: [:index, :show]
    before_action :set_category , only: [:show, :edit, :update, :destroy]

    def show
        @articles = @category.articles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @categories=Category.paginate(page: params[:page], per_page: 5)
    end

    def new
        @category=Category.new
    end

    def edit
    end

    def create
        @category=Category.new(category_params)
        if @category.save
            flash[:notice]="Category was successfully created"
            redirect_to @category
        else
        render :new, status: :unprocessable_entity
        end
    end

    def update
        
        if @category.update(category_params)
        flash[:notice] = "Category was edited successfully"
        redirect_to @category
       else
        render :edit, status: :unprocessable_entity
       end
    end
    
    def destroy
        @category.destroy
        flash[:notice] = "Category was deleted successfully"
        redirect_to articles_path
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find(params[:id])
    end

    def require_admin
        if !(logged_in && current_user.admin?)
            flash[:alert]="You cannot add categories"
            redirect_to categories_path
        end
    end
end
