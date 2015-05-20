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
        if @dataset.save
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
        params.require(:dataset).permit(:name,:filename,:thumbnail,:description,:height,:width,:frames)
    end
end
