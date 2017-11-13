class Creator::SubtopicsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_authorized_for_current_section
    
    def new
        @subtopic = Subtopic.new
    end
    
    def create
        @subtopic = current_section.subtopics.create(subtopic_params)
        redirect_to creator_compilation_path(current_section.compilation)
    end
    
    private
    
    def require_authorized_for_current_section
        if current_section.compilation.user != current_user
            return render plain: 'Unauthorized', status: :unauthorized
        end
            
    end
    
    helper_method :current_section
    def current_section
        @current_section ||= Section.find(params[:section_id])
    end
    
    def subtopic_params
        params.require(:subtopic).permit(:title)
    end
end
