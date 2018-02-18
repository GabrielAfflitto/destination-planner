class Api::V1::DestinationsController < ActionController::API

  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    render json: Destination.create(destination_params)
  end

  def destroy
    Destination.delete(params[:id])
  end

  private

    def destination_params
      params.require(:destination).permit(:name, :image_url, :description, :zip)
    end

end
