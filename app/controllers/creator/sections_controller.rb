class Creator::SectionsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_compilation
    def new
        @section = Section.new
    end
    
    def create
        @section = current_compilation.sections.create(section_params)
        redirect_to creator_compilation_path(current_compilation)
    end
    
    private
    
    def require_authorized_for_current_compilation
        if current_compilation.user != current_user
            render plain: 'Unauthorized', status: :unauthorized
        end
    end
    
    helper_method :current_compilation
    def current_compilation
        @current_compilation ||= Compilation.find(params[:compilation_id])
    end
    
    def section_params
        params.require(:section).permit(:title)
    end
end
