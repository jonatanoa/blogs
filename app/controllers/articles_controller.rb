class ArticlesController < ApplicationController

    before_action :find_article, except: [:new,:create,:index,:from_author]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] #solo los usuarios que inicien sesion podran haces estas acciones

    def index
        @articles = Article.all
    end

    def show #permitira buscar un articulo y mostrarlo
         # @article = Article.find(params[:id])   # este ya se encuentra en find_article
    end

    def edit
        # @article = Article.find(params[:id])  # este ya se encuentra en find_article
        @categories = Category.all
    end 

    def update #update es un metodo que se manda a llamar desde el objeto (@article) a diferencia de create que se manda a llamar desde la clase
        # @article = Article.find(params[:id])
        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def new #va a mostrar un formulario
        @article = Article.new
        @categories = Category.all
        #@article.title = 'demo', este es un ejemplo para llenar en campo
        #@article.description = 'juanes es petardiño', este es un ejemplo para llenar en campo
    end

    def create #guardara lo que hayamos recibido del formulario
        @article = current_user.articles.create(article_params)
        @article.save_categories
        # render json: @article
        redirect_to @article
    end 

    def destroy
        # @article = Article.find(params[:id])   # este ya se encuentra en find_article
        @article.destroy 
        redirect_to @article
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.find(params[:id])
    end
    
    #parametros fuertes
    def article_params
        params.require(:article).permit(:title,:content, category_elements: [])
    end
end
