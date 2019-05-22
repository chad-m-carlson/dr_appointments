class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    
  end

  def show
    
  end

  def new
    @appointment = @doctor.appointments.new
    @patients = Patient.all
  end

  def create
    @appointment = @doctor.appointments.new(appt_params)
    if @appointment.save
      redirect_to doctor_appointments_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appointment = @doctor.appointments.find(params[:id])
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end
  
  private

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def set_patients
      @patient = Patient.find(params[:patient_id])
    end

    def appt_params
      params.require(:appointment).permit(:date, :visit_type, :doctor_id, :patient_id)
    end
end
