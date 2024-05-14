class ArticlesController <ApplicationController

    def show
        # debugger
    @article = Article.find(params[:id])
    end

    def index
        #debugger
        @articles = Article.all
    end
end