
    class UsersController < ApplicationController
      def index 
        users = User.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Usários Carregados', data: users }, status: :ok
      end
      def show 
        user = User.find(params[:id])
        render json: user, status: :ok
      end
      def create
        user = User.new(user_params)
        Studio.new
          if user.save
            render json: user ,status: :ok
          else
            render json: {status: 'ERROR', message: 'Usuário não salvo',data: user}, status: :unprocessable_entity
          end
      end
      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message: 'Usuário deletado', data: user}, status: :ok 
      end
      def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user, status: :ok
        else 
          render json: {status: 'ERROR', message:'Usuário não atualizado', data: user}, status: :unprocessable_entity
        end
      end
     
      private
      def user_params
        params.require(:user).permit(:name, :email, :birth_date, :cpf, :photo_url)
      end
    end
