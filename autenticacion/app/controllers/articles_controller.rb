class ArticlesController < ApplicationController
	#Variables con "@" sirven para manipular esa variable ya sea
	#vistas o controladores, la variable sin @ solo se puede usar 
	#en el controlador, en el cual fue declarada

	#GET /articles
	def index
		#Todos los registros 
		@article = Article.all #Trae todos los datos de la BD
	end
	#GET /articles/:id
	def show
		#Encontrar registro por ID
		@article = Article.find(params[:id])
		#where
		
		#Article.where("id = ? OR|AND title = ? ",params[:id],params[:title])
		#sean diferente
		#Article.where.not("id = ?",params[:id])
	end
	#GET /articles/new
	def new
		#Se manda un objeto(articulo) basio
		@article = Article.new
	end
	#POST /articles
	def create
		#Se inserta el objeto en la BD
		#sintaxis: new ("campo" params["formulario"]["Campo"])
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		#Manera corta de hacer un insert del Objeto a la BD
		@article = Article.new(article_params)

		#Create llama automaticamente al metodo save
		#@article = Article.create(title: params[:article][:title], body: params[:article][:body])

		#@article.valid? es el articulo valido
		#@article.invalid? es el articulo invalido
		#Guardar en BD
		if @article.save
			#redireccionamiento
			redirect_to @article
		else
			render :new
		end
	end

	def edit
		#Se manda el objeto(articulo) al formulario
		@article = Article.find(params[:id])
	end

	#PUT /articles/:id
	def update 
		#Update
		#Actualiza el objeto en la BD
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	#delete "/articles/:id" destroy
	def destroy
		#Delete
		#Busca el Articulo en la Bd
		@article = Article.find(params[:id])
		#Destroy elimina el objeto de la BD
		@article.destroy
		#Se redirecciona a la pagina
		redirect_to articles_path
	end

	#------------------------------------------------------------------
	#Metodos privados
	private
	def article_params
		#Campos que se permitiran para la creacion del objeto
		params.required(:article).permit(:title,:body)
	end
end