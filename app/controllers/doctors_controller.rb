class DoctorsController < ApplicationController
  before_action :doctor_find, only:[:show, :edit, :update, :destroy]
  
  def index
    @doctors = Doctor.all
  end
 
  def show
    doctor_find
    @doctor_appointments = @doctor.appointments.all
  end

   def new
    @doctor = Doctor.new
    @doctor.appointments.build
  end


  def create
    @doctor = Doctor.new(doctor_params)
      if @doctor.save
        redirect_to doctors_path
      else
        render 'new'
      end
  end

  def edit
    doctor_find
  end

  def update
    doctor_find
      if @doctor.update(doctor_params)
        redirect_to doctors_path
      else
        render 'edit'
      end
  end

  def destroy
    doctor_find
    if @doctor.destroy
      redirect_to doctors_path  	
    end
  end
  
    private 
    def doctor_find
      @doctor = Doctor.find(params[:id])
    end
    def doctor_params 
    params.require(:doctor).permit(:id, :name, :specialization, appointments_attributes: [:id, :date, :room_no, :doctor_id, :patient_id])
    end
end
