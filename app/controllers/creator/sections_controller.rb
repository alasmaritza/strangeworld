class Creator::SectionsController < ApplicationController
    def new
        @compilation = Compilation.find(params[:compilation_id])
        @section = Section.new
    end
    
    def create
        @compilation = Compilation.find(params[:compilation_id])
        @section = @compilation.sections.create(section_params)
        redirect_to creator_compilation_path(@compilation)
    end
    
    private
    
    def section_params
        params.require(:section).permit(:title)
    end
end
