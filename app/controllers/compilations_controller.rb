class CompilationsController < ApplicationController
    def index
        @compilations = Compilation.all
    end
    
    def show
        @compilation = Compilation.find(params[:id])
    end
end
