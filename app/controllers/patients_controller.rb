class PatientsController < ApplicationController

    # before_action :authenticate_patient!
  def index
    # redirect_to patient_path(current_patient.id)
  end

  def show
    :authenticate_patient!
    @patient = Patient.find(params[:id])
    @appointments = @patient.appointments.where("start_datetime > ?", DateTime.now)
  end
  
  def omniauth
    ::OmniAuth.config.path_prefix = '/patient/auth'
    redirect_to google_oauth2_patient_path("google_oauth2")
  end

  def eta
    @appointment = Appointment.where(:patient_id => eta_params[:id], :doctor_id => eta_params[:doctor_id])
    @appointment[0].update(eta: eta_params[:eta])
    # binding.pry
    render nothing: true

    # respond_to do |format|
    #   format.html { render nothing: true }
    #   format.json { render :json => @patient }
    # end
  end

  def find_appointments
    @appointments = Appointments.where(:patient_id => params[:id])
    render json: @appointments
    # binding.pry
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone)
  end

  def eta_params
    params.permit(:eta, :id, :doctor_id)
  end


end
