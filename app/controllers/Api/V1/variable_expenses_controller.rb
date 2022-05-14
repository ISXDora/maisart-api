module Api 
  module V1
    class VariableExpensesController < ApplicationController
      def index 
        variableExpenses = VariableExpense.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Despesas variáveis Carregadas', data: variableExpenses}, status: :ok
      end
      def show 
        variableExpense = VariableExpense.find(params[:id])
        render json: {status: 'SUCCESS', message:'Despesa variável Carregada', data: variableExpense}, status: :ok
      end
      def create 
        variableExpense = VariableExpense.new(variableExpense_params)
          if variableExpense.save
            render json: {status: 'SUCCESS', message:'Despesa variável salva', data: variableExpense}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Despesa variável não salva', data: variableExpense}, status: :unprocessable_entity
          end
      end
      def destroy
        variableExpense = VariableExpense.find(params[:id])
        variableExpense.destroy
        render json: {status: 'SUCCESS', message: 'Despesa variável deletada', data: variableExpense}, status: :ok 
      end
      def update
        variableExpense = VariableExpense.find(params[:id])
        if variableExpense.update(variableExpense_params)
          render json: {status: 'SUCCESS', message: 'Despesa variável atualizada', data: variableExpense}, status: :ok
        else 
          render json: {status: 'ERROR', message:'Despesa variável não atualizada', data: variableExpense}, status: :unprocessable_entity
        end
      end

      private
      def variableExpense_params
        params.permit(:name, :value, :studio_id )
      end
    end
  end
end 