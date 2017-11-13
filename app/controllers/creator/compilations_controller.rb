class Creator::CompilationsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_compilation, only: [:show]
    
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
    end
    
    private
    
    def require_authorized_for_current_compilation
        if current_compilation.user != current_user
            render plain: "Unauthorized", status: :unauthorized
        end
    end
    
    helper_method :current_compilation
    
    def current_compilation
        current_compilation ||= Compilation.find(params[:id])
    end
    
    def compilation_params
        params.require(:compilation).permit(:title, :description, :donation, :image)
    end
end
