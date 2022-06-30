module Api 
  module V1
    class ProductsController < ApplicationController
      def index 
        products = Product.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Produtos Carregados', data: products}, status: :ok
      end
      def show 
        product = Product.find(params[:id])
        render json: {status: 'SUCCESS', message:'Produto Carregado', data: product}, status: :ok
      end
      def create 
        product = Product.new(products_params)
          if product.save
            render json: {status: 'SUCCESS', message:'Produto salvo', data: product}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Produto não salvo', data: product}, status: :unprocessable_entity
          end
      end
      def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {status: 'SUCCESS', message: 'Produto deletado', data: product}, status: :ok 
      end
      def update
        product = Product.find(params[:id])
        if product.update(products_params)
          render json: {status: 'SUCCESS', message: 'Produto atualizado', data: product}, status: :ok
        else 
          render json: {status: 'ERROR', message:'Produto não atualizado', data: product}, status: :unprocessable_entity
        end
      end

      private
      def products_params
        params.permit(:name, :price, :studio_id )
      end
    end
  end
end 