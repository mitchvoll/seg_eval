class DatasetsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create]
    def index
        @datasets = Dataset.all
    end

    def new
        @dataset = Dataset.new
    end

    def create
        @dataset = current_user.datasets.build(dataset_params)
        @dataset.download_num = 0
        if @dataset.save
            uploaded_file = params[:dataset][:file]
            filename = uploaded_file.original_filename
            dir = Rails.root.join('public','uploads','dataset',current_user.id.to_s,@dataset.id.to_s)
            FileUtils.mkdir_p(dir) unless File.directory?(dir)
            File.open(Rails.root.join('public','uploads','dataset',current_user.id.to_s,@dataset.id.to_s,
                                      filename), 'wb') do |file|
                file.write(uploaded_file.read)
            end
            flash[:sucess] = "Success: new dataset created!"
            redirect_to @dataset
        else
            render 'new'
        end
    end

    def destroy
    end

    def show
        @dataset = Dataset.find(params[:id])
    end

    private

    # TODO: will need to remove filename and thumbnail as these will be generated from uploaded files
    def dataset_params
        permitted = params.require(:dataset).permit(:name,:description,:height,:width,:frames)
        permitted[:filename] = params[:dataset][:file].original_filename
        return permitted
    end
end
