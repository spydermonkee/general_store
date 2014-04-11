class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(secure_params)

    if @product.save
      flash[:notice] = 'Product saved'
      redirect_to :back
    else
      flash[:alert] = 'Errors creating product'
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(secure_params)
      flash[:notice] = 'Product updated'
      redirect_to products_path(@product.id)
    else
      flash[:alert] = 'Problem updating product'
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = 'Product deleted'
    redirect_to products_path
  end

private
  def secure_params
    params.require(:product).permit(:name, :description, :price)
  end
end
