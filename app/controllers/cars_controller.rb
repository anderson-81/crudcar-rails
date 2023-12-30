class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def new
    @customer = Customer.find(params[:customer_id])
    @car = Car.new
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
        format.html { redirect_to customer_show_path(@car.Customer_id), notice: 'Car was successfully created.'}
      else
        @customer = Customer.find(@car)
        format.html { render :new }
      end
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @car = Car.find(params[:car_id])
    @car.Customer_id = params[:customer_id]
    respond_to do |format|
      if @car.update(car_params)
        flash[:success] = 'Car was successfully edited.'
        format.html { redirect_to customer_show_path(@car.Customer_id)}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @car = Car.find(params[:car_id])
    @car.destroy
    respond_to do |format|
      format.html { redirect_to customer_show_path(@car.Customer_id), notice: 'Car was successfully deleted.' }
    end
  end

  private
    def set_car
      @car = Car.where("id = ?", params[:car_id])
    end

    def car_params
      params.require(:car).permit(:id, :model, :plate, :year, :marketval, :Customer_id, :avatar)
    end
end
