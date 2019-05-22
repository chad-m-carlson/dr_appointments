class DoctorsController < ApplicationController
  before_action :get_doctors, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(dr_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(dr_params)
      redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

  def get_doctors
    @doctor = Doctor.find(params[:id])
  end

  def dr_params
    params.require(:doctor).permit(:first_name, :last_name, :specialty)
  end
end
