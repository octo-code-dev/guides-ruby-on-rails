class TelefonesController < ApplicationController

    def index
    end
    
    def show
    end
    
    def new
    end
    
    def edit
      @pessoa = Pessoa.find(params[:pessoa_id])
      @telefone = @pessoa.telefones.find(params[:id])
    end
    
    def create
      @pessoa = Pessoa.find(params[:pessoa_id])
      @telefone = @pessoa.telefones.create(telefone_params)
      redirect_to pessoa_path(@pessoa)
    end
    
    def update
      @pessoa = Pessoa.find(params[:pessoa_id])
      @telefone = Telefone.find(params[:id])
      if @telefone.update(telefone_params)
        redirect_to @pessoa
      else
        render 'edit'
      end
    end
    
    def destroy
      @pessoa = Pessoa.find(params[:pessoa_id])
      @telefone = @pessoa.telefones.find(params[:id])
      @telefone.destroy
      redirect_to pessoa_path(@pessoa)
    end
    
    private
      def telefone_params
        params.require(:telefone).permit(:numero, :tipo, :contato)
      end  

end
