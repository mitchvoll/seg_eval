class AlgorithmsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]

    def index
        @algorithms = Algorithm.all
    end

    def new
        @algorithm = Algorithm.new
    end

    def create
        if @algorithm.save
            uploaded_file = params[:algorithm][:filename]
            filename = uploaded_file.original_filename
            @algorithm = current_user.algorithms.build(algorithm_params)
            puts @algorithm.id
            dir = Rails.root.join('public','uploads','algorithm',current_user.id.to_s,@algorithm.id.to_s)
            puts dir
            FileUtils.mkdir_p(dir) unless File.directory?(dir)
            File.open(Rails.root.join('public','uploads','algorithm',current_user.id.to_s,@algorithm.id.to_s,filename),
                      'wb') do |file|
                file.write(uploaded_file.read)
            end
            flash[:success] = "Success: new algorithm created!"
            redirect_to @algorithm
        else
            render 'new'
        end
    end

    def show
        @algorithm = Algorithm.find(params[:id])
    end

    private

    def algorithm_params
        permitted = params.require(:algorithm).permit(:name, :description, :code, :filetype)
        permitted[:filename] = params[:algorithm][:filename].original_filename
        permitted
    end

    def algorithm_filename
        params.require(:algorithm).permit(:filename)
    end
end
