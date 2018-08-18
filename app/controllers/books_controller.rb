class BooksController < ApplicationController
  # GET
  def index
  	@books = Book.all #lista todos os livros do banco de dados
  end

  # GET
  def new
    @book = Book.new # criando um objeto novo do tipo Book
  end

  # POST
  def create
    @book = Book.new(books_params) #crio um objeto com os dados que vieram do usuário
    @book.save #saalvo no banco de dados e ele vai criar um ID o banco de dados

    #redirect é uma nova requisição, minhas actions não conversam
    redirect_to @book #show porque o @book já tem um objeto com o ID, éum objeto só
  end

  # GET
  def show
  	#como ela não seconversam, eu preciso procurar no  banco de dados de novo
    @book = Book.find(params[:id])
  end

  private

  def books_params
    params.require(:book).permit(:title, :author, :genre, :year)
  end
end