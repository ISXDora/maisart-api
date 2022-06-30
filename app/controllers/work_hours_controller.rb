    class WorkHoursController < ApplicationController
      def index 
        workHours = WorkHour.order('created_at DESC')
        render json: {status: 'SUCCESS', message:'Horas de trabalho Carregadas', data: workHours}, status: :ok
      end
      def show 
        workHour = WorkHour.find(params[:id])
        render json: {status: 'SUCCESS', message:'Hora de trabalho Carregada', data: workHour}, status: :ok
      end
      def calcHour 
        workHour = WorkHour.find(params[:id])
        @hourly_rate =   workHour.hourly_rate

        teste = (workHour.working_hours_per_day * workHour.working_days_per_week)  * 4.3 
        @hourly_rate =  workHour.compensation / teste
        render json: {status: 'SUCCESS', message:'Hora de trabalho Calculada', data: @hourly_rate}, status: :ok

      end
      def create 
        workHour = WorkHour.new(workHour_params)
          if workHour.save
            render json: {status: 'SUCCESS', message:'Hora de trabalho salva', data: workHour}, status: :ok
          else
            render json: {status: 'ERROR', message: 'Hora de trabalho não salva', data: workHour}, status: :unprocessable_entity
          end
      end
      def destroy
        workHour = WorkHour.find(params[:id])
        workHour.destroy
        render json: {status: 'SUCCESS', message: 'Hora de trabalho deletada', data: workHour}, status: :ok 
      end
      def update
        workHour = WorkHour.find(params[:id])
        if workHour.update(workHour_params)
          render json: {status: 'SUCCESS', message: 'Hora de trabalho atualizada', data: workHour}, status: :ok
        else 
          render json: {status: 'ERROR', message:'Hora de trabalho não atualizada', data: workHour}, status: :unprocessable_entity
        end
      end
      
      private
      def workHour_params
        params.permit(:compensation, :working_hours_per_day, :working_days_per_week, :hourly_rate, :user_id, :id)
      end
    end
