class EmailsController < ApplicationController

    def index
    end
    
    def show
    end
    
    def new
    end
    
    def edit
      @pessoa = Pessoa.find(params[:pessoa_id])
      @email = @pessoa.emails.find(params[:id])
    end
    
    def create
      @pessoa = Pessoa.find(params[:pessoa_id])
      @email = @pessoa.emails.create(email_params)
      redirect_to pessoa_path(@pessoa)
    end
    
    def update
      @pessoa = Pessoa.find(params[:pessoa_id])
      @email = Email.find(params[:id])
      if @email.update(email_params)
        redirect_to @pessoa
      else
        render 'edit'
      end
    end
    
    def destroy
      @pessoa = Pessoa.find(params[:pessoa_id])
      @email = @pessoa.emails.find(params[:id])
      @email.destroy
      redirect_to pessoa_path(@pessoa)
    end
    
    private
      def email_params
        params.require(:email).permit(:enderecoemail, :observacao)
      end  


end
