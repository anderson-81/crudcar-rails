class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:search]
      @customers = Customer.SearchName(params[:search]).paginate(:page => params[:page], :per_page => 1)
    else
      @customers = Customer.all.paginate(:page => params[:page], :per_page => 1)
    end
  end

  def show
    @cars = Car.where("Customer_id = ?", params[:customer_id]).paginate(:page => params[:page], :per_page => 1)
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @customer
  end

  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_show_path(@customer), notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_show_path(@customer), notice: 'Customer was successfully edited.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if Car.where("Customer_id = ?", params[:customer_id]).count == 0
      @customer.destroy
      respond_to do |format|
        format.html { redirect_to customers_path, notice: 'Customer was successfully destroyed.' }
      end
    else
      flash[:danger] = 'Costumer has car related and can not be excluded.'
      redirect_to customer_show_path(@customer)
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :salary, :birthday, :gender, :avatar)
    end
end
