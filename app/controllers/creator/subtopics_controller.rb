class Creator::SubtopicsController < ApplicationController
    def new
        @section = Section.find(params[:section_id])
        @subtopic = Subtopic.new
    end
    
    def create
        @section = Section.find(params[:section_id])
        @subtopic = @section.subtopics.create(subtopic_params)
        redirect_to creator_compilation_path(@section.compilation)
    end
    
    private
    
    def subtopic_params
        params.require(:subtopic).permit(:title)
    end
end
