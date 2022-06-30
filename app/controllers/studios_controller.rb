    class StudiosController < ApplicationController
      def index 
        studios = Studio.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Ateliês Carregados', data: studios}, status: :ok
      end
      def show 
        studio = Studio.find(params[:id])
        render json: {status: 'SUCCESS', message:'Ateliê Carregado', data: studio}, status: :ok
      end
      def create 
        studio = Studio.new(studio_params)
          if studio.save
            render json: studio, status: :ok
          else
            render json: {status: 'ERROR', message: 'Ateliê não salvo', data: studio}, status: :unprocessable_entity
          end
      end
      def destroy
        studio = Studio.find(params[:id])
        studio.destroy
        render json: {status: 'SUCCESS', message: 'Ateliê deletado', data: studio}, status: :ok 
      end
      def update
        studio = Studio.find(params[:id])
        if studio.update(studio_params)
          render json: {status: 'SUCCESS', message: 'Ateliê atualizado', data: studio}, status: :ok
        else 
          render json: {status: 'ERROR', message:'Ateliê não atualizado', data: studio}, status: :unprocessable_entity
        end
      end

      

      private
      def studio_params 
        params.permit(:name, :cnpj, :user_id, :count_product )
      end
    end
