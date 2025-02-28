class SchoolClassesController < ApplicationController
    def index
        @school_class = SchoolClass.all
    end

    def show
        find_school_class
    end

    def new 
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(school_class_params)
        redirect_to school_class_path(@school_class)
    end

    def edit
        find_school_class
    end

    def update
        @sc = find_school_class
        @sc.update(school_class_params)
        redirect_to school_class_path(@school_class)
    end

    private

    def school_class_params
        params.require(:school_class).permit(:title, :room_number)
    end

    def find_school_class
        @school_class = SchoolClass.find_by(id: params[:id])
    end

end
