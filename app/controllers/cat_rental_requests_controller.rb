class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    @rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cats = Cat.all
    @rental_request = CatRentalRequest.new(rental_params)
    if @rental_request.save
      redirect_to cat_url(@rental_request.cat)
    else
      render :new
    end
  end

  private
  def rental_params
    params.require(:rental_request).permit(:cat_id, :start_date, :end_date)
  end
end