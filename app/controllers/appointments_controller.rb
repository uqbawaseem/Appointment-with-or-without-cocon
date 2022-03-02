class AppointmentsController < ApplicationController
  before_action :appointment_find, only:[:show, :edit, :update, :destroy]
  def index
    @appointments = Appointment.all
  end
 

  def show
    appointment_find
  end

       
   def new
    @appointment = Appointment.new
  end


  def create
    @appointment = Appointment.new(appointment_params)
      if @appointment.save
        redirect_to appointments_path
      else
        render :'new'
      end
  end


  def edit
    appointment_find
  end


  def update
    appointment_find
      if @appointment.update(appointment_params)
        redirect_to appointments_path
      else
        render :'edit'
      end
  end


  def destroy
    appointment_find
    if @appointment.destroy
      redirect_to appointments_path  	
    end
  end
  

    private 
    def appointment_find
      @appointment = Appointment.find(params[:id])
    end
    def appointment_params 
    params.require(:appointment).permit(:room_no, :date, :patient_id, :doctor_id)
    end
end
