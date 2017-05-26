class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  
  def new
    @customer = Customer.find(params[:custID])
    @car = Car.new
  end

  def show
    print params[:id]
    @car = Car.find(params[:id])
    @customer = Customer.find(@car.Customer_id) 
  end

  def edit
    @car = Car.find(params[:carID])
    @customer = Customer.find(params[:custID])  
  end

  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
        format.html { redirect_to "/customers/#{@car.Customer_id}", notice: 'Car was successfully created.'} 
      else
        @customer = Customer.find(@car.Customer_id)
        format.html { render :new }
      end
    end
  end

  def update
    @car = Car.find(params[:id])
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to "/customers/#{@car.Customer_id}", notice: 'Car was successfully updated.'} 
      else
        @customer = Customer.find(@car.Customer_id)
        format.html { render :edit }
      end
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @customer_id = @car.Customer_id
    @car.destroy
    respond_to do |format|
      format.html { redirect_to "/customers/#{@customer_id}", notice: 'Car was successfully deleted.' }
    end
  end

  private
    def set_car
      @car = Car.where("id = ?", params[:carID])
    end

    def car_params
      params.require(:car).permit(:model, :plate, :year, :marketval, :Customer_id, :avatar)
    end
end
