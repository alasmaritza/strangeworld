class CompilationsController < ApplicationController
    def index
        @compilations = Compilation.all
    end
end
