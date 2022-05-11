module Api 
  module V1
    class StudiosController < ApplicationController
      def index 
        studios = Studio.order('created_at DESC')
        render json: (status: 'SUCCESS', message:'Ateliês Carregados', data: studios), status: :ok
      end
      def show 
        studio = Studio.find(params[:id])
        render json: (status: 'SUCCESS', message:'Ateliê Carregado', data: studio), status: :ok
      end
      def create 
        studio = Studio.new(user_params)
          if user.save
            render json: (status: 'SUCCESS', message:'Ateliê salvo', data: studio), status: :ok
          else
            render json: (status: 'ERROR', message: 'Ateliê não salvo', data: studio), status: :unprocessable_entity
          end
      end
      def destroy
        studio = Studio.find(params[:id])
        studio.destroy
        render json: (status: 'SUCCESS', message: 'Ateliê deletado', data: studio), status: :ok 
      end
      def update
        studio = Studio.find(params[:id])
        if user.update_attributes(user_params)
          render json: (status: 'SUCCESS', message: 'Ateliê atualizado', data: studio), status: :ok
        else 
          render json: (status: 'ERROR', message:'Ateliê não atualizado', data: studio), status: :unprocessable_entity
        end
      end
    end
  end
end