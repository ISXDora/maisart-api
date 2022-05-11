module Api 
  module V1
    class UsersController < ApplicationController
      def index 
        users = User.order('created_at DESC')
        render json: (status: 'SUCCESS', message:'Uusários Carregados', data: users), status: :ok
      end
      def show 
        user = User.find(params[:id])
        render json: (status: 'SUCCESS', message:'Uusário Carregado', data: user), status: :ok
      end
      def create 
        user = User.new(user_params)
          if user.save
            render json: (status: 'SUCCESS', message:'Usuário salvo', data: user), status: :ok
          else
            render json: (status: 'ERROR', message: 'Usuário não salvo', data: user), status: :unprocessable_entity
          end
      end
      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: (status: 'SUCCESS', message: 'Usuário deletado', data: user), status: :ok 
      end
      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: (status: 'SUCCESS', message: 'Usuario atualizado', data: user), status: :ok
        else 
          render json: (status: 'ERROR', message:'Usuário não atualizado', data: user), status: :unprocessable_entity
        end
      end
    end
  end
end