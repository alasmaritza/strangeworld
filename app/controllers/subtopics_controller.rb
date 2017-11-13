class SubtopicsController < ApplicationController
    def show
    end
    
    private
    
    helper_method :current_subtopic
    
    def current_subtopic
        @current_subtopic ||= Subtopic.find(params[:id])
    end
end
