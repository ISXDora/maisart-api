module Api 
  module V1
    class FixedExpensesController < ApplicationController
      def index 
        fixedExpenses = FixedExpense.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Despesas fixas Carregadas', data: fixedExpenses}, status: :ok
      end
      def show 
        fixedExpense = FixedExpense.find(params[:id])
        render json: {status: 'SUCCESS', message:'Despesa fixa Carregada', data: fixedExpense}, status: :ok
      end
      def create 
        fixedExpense = FixedExpense.new(fixedExpense_params)
          if fixedExpense.save
            render json: {status: 'SUCCESS', message:'Despesa fixa salva', data: fixedExpense}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Despesa fixa não salva', data: fixedExpense}, status: :unprocessable_entity
          end
      end
      def destroy
        fixedExpense = FixedExpense.find(params[:id])
        fixedExpense.destroy
        render json: {status: 'SUCCESS', message: 'Despesa fixa deletada', data: fixedExpense}, status: :ok 
      end
      def update
        fixedExpense = FixedExpense.find(params[:id])
        if fixedExpense.update(fixedExpense_params)
          render json: {status: 'SUCCESS', message: 'Despesa fixa atualizada', data: fixedExpense}, status: :ok
        else 
          render json: {status: 'ERROR', message:'Despesa fixa não atualizada', data: fixedExpense}, status: :unprocessable_entity
        end
      end

      private
      def fixedExpense_params
        params.permit(:name, :value, :studio_id )
      end
    end
  end
end 