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
    @customer = Customer.find(params[:id])
    @cars = Car.where("Customer_id = ?", params[:id]).paginate(:page => params[:page], :per_page => 1)
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    print @customer
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @qtd = Customer.joins("INNER JOIN cars ON cars.Customer_id = customers.id").where('customers.id' => params[:id]).count
    if @qtd == 0  
      @customer.destroy
      respond_to do |format|
        format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      end
    else
      @customer = Customer.find(params[:id])
      @cars = Car.where("Customer_id = ?", params[:id]).paginate(:page => params[:page], :per_page => 1)
      flash[:notice] = 'Costumer has car related and can not be excluded.'
      redirect_to(@customer)
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:name, :email, :salary, :birthday, :gender, :avatar)
    end
end
