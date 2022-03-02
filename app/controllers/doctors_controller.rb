class DoctorsController < ApplicationController
  before_action :doctor_find, only:[:show, :edit, :update, :destroy]
  def index
    @doctors = Doctor.all
  end
 

  def show
    doctor_find
  end

       
   def new
    @doctor = Doctor.new
  end


  def create
    @doctor = Doctor.new(doctor_params)
      if @doctor.save
        redirect_to doctors_path
      else
        render :'new'
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
        render :'edit'
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
    params.require(:doctor).permit(:name, :specialization)
    end
end
