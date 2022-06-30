module Api 
  module V1
    class VariableProductExpensesController < ApplicationController
      def index 
        variableProductExpenses = VariableProductExpense.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Despesas variáveis Carregadas', data: variableProductExpenses}, status: :ok
      end
      def show 
        variableProductExpense = VariableProductExpense.find(params[:id])
        render json: {status: 'SUCCESS', message:'Despesa variável Carregada', data: variableProductExpense}, status: :ok
      end
      def create 
        variableProductExpense = VariableProductExpense.new(variableProductExpense_params)
          if variableProductExpense.save
            render json: {status: 'SUCCESS', message:'Despesa variável salva', data: variableProductExpense}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Despesa variável não salva', data: variableProductExpense}, status: :unprocessable_entity
          end
      end
      def destroy
        variableProductExpense = VariableProductExpense.find(params[:id])
        variableProductExpense.destroy
        render json: {status: 'SUCCESS', message: 'Despesa variável deletada', data: variableProductExpense}, status: :ok 
      end
      def update
        variableProductExpense = VariableProductExpense.find(params[:id])
        if variableProductExpense.update(variableProductExpense_params)
          render json: {status: 'SUCCESS', message: 'Despesa variável atualizada', data: variableProductExpense}, status: :ok
        else 
          render json: {status: 'ERROR', message:'Despesa variável não atualizada', data: variableProductExpense}, status: :unprocessable_entity
        end
      end

      private
      def variableProductExpense_params
        params.permit(:name, :value, :product_id )
      end
    end
  end
end 