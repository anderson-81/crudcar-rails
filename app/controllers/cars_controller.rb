class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def new
    @customer = Customer.find(params[:custID])
    @car = Car.new
  end

  def show
    @car = Car.find(params[:carID])
    @customer = Customer.find(params[:custID]) 
  end

  def edit
    @car = Car.find(params[:carID])
    @customer = Customer.find(params[:custID])  
  end

  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
        format.html { redirect_to "/", notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @car = Car.find(params[:id])
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to "/", notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car = Car.find(params[:carID])
    @customer = Customer.find(params[:custID])
    @car.destroy
    respond_to do |format|
      format.html { redirect_to "/", notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
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
