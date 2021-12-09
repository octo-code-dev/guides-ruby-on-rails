class EnderecosController < ApplicationController
  before_action :set_address, only: [:edit, :show]
  before_action :new_address, only: :new
  
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def edit   
  end
  
  def create
    @pessoa = Pessoa.find(params[:pessoa_id])
    @endereco = @pessoa.enderecos.create(endereco_params)
    redirect_to pessoa_path(@pessoa)
  end
  
  def update
    @pessoa = Pessoa.find(params[:pessoa_id])
    @endereco = Endereco.find(params[:id])
    if @endereco.update(endereco_params)
      redirect_to @pessoa
    else
      render 'edit'
    end
  end
  
  def destroy
    @pessoa = Pessoa.find(params[:pessoa_id])
    @endereco = @pessoa.enderecos.find(params[:id])
    @endereco.destroy
    redirect_to pessoa_path(@pessoa)
  end
  
  private
    def new_address
      @pessoa = Pessoa.find(params[:pessoa_id])
      @endereco = @pessoa.enderecos.build
    end

    def set_address
      @endereco = Endereco.find(params[:id])
    end

    def endereco_params
      params.require(:endereco).permit(:cep, :logradouro, :numero, :complemento, :bairro, :pais, :estado, :municipio, :referencia)
    end
end
