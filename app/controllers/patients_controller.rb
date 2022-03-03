class PatientsController < ApplicationController
  before_action :patient_find, only:[:show, :edit, :update, :destroy]
  
  def index
    @patients = Patient.all
  end

  def show
    patient_find
    @patient_appointments = @patient.appointments.all
    
  end

   def new
    @patient = Patient.new
    @patient.appointments.build

  end

  def create
    @patient = Patient.new(patient_params)
      if @patient.save
        @patient_appointments = @patient.appointments.all
        redirect_to patients_path
      else
        render 'new'
      end
  end

  def edit
    patient_find
  end

  def update
    patient_find
      if @patient.update(patient_params)
        redirect_to patients_path
      else
        render 'edit'
      end
  end

  def destroy
    patient_find
    if @patient.destroy
      redirect_to patients_path  	
    end
  end
  
    private 
    def patient_find
      @patient = Patient.find(params[:id])
    end
    def patient_params 
    params.require(:patient).permit(:name, appointments_attributes: [:id, :date, :room_no, :doctor_id, :patient_id])
    end
end
