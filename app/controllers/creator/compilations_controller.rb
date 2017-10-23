class Creator::CompilationsController < ApplicationController
    before_action :authenticate_user!
    def new 
        @compilation = Compilation.new
    end
    
    def create
        @compilation = current_user.compilations.create(compilation_params)
        
        if @compilation.valid?
            redirect_to creator_compilation_path(@compilation)
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def show
        @compilation = Compilation.find(params[:id])
    end
    
    private
    
    def compilation_params
        params.require(:compilation).permit(:title, :description, :donation)
    end
end
