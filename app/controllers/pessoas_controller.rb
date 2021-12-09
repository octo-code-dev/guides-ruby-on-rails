class PessoasController < ApplicationController
  def index
    @pessoas = Pessoa.all
  end
  
  def show
    @pessoa = Pessoa.find(params[:id])
  end
  
  def new
    @pessoa = Pessoa.new
  end
  
  def edit
    @pessoa = Pessoa.find(params[:id])
  end
  
  def create
    @pessoa = Pessoa.new(pessoa_params)
    
    if @pessoa.save
      redirect_to @pessoa
    else
      render 'new'
    end
  end
  
  def update
    @pessoa = Pessoa.find(params[:id])
    
    if @pessoa.update(pessoa_params)
      redirect_to @pessoa
    else
      render 'edit'
    end
  end
  
  def destroy
    @pessoa = Pessoa.find(params[:id])
    @pessoa.destroy
    
    redirect_to pessoas_path
  end
  
  private
    def pessoa_params
      params.require(:pessoa).permit(:nomecompletoourazaosocial,:nomefantasia,:cpfoucnpj,:inscricaoestadual,:rg)
    end
end
