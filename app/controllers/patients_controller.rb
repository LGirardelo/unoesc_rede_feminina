class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    #binding.pry
    @patients = Patient.joins(:person).all
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    #@patient = Patient.joins(:person).find(params[:id])
  end

  # GET /patients/new
  def new
    @person = Person.new
    @patient = Patient.new
    @patient.person = @person
  end

  # GET /patients/1/edit
  def edit
   # @patient = Patient.joins(:person).find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    
    #binding.pry

    @patient = Patient.new(patient_params)
   
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      @person = @patient.person
      if @person.update(patient_params[:person_attributes])
        if patient_params.present?
          @patient.update(patient_params)
          format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
          format.json { render :show, status: :ok, location: @patient }
          else
          format.html { render :edit }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy

    @patient.person.destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def obtained
    respond_to do |format|
      @patient = Patient.joins(:person).find(params[:id])

      if @patient.update(:date_obtained => Time.now)
          format.html { redirect_to '/patients', notice: 'Patient was successfully updated.' }
          format.json { render :show, status: :ok, location: @patient }
      else
          format.html { render :edit }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.

    def set_patient
      
      @patient = Patient.joins(:person).find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      #params.require(:patient).permit(:sus_card_number, :name)
      params.require(:patient).permit(:sus_card_number, :profissional_address, :home_address, :conjugal_name, :profession_conjugate, :conjugate_contact, :have_children, :number_of_children, :age_children, :note, :local_birth, :date_register, :date_obtained, :active, person_attributes:[:name, :cpf, :rg, :home_phone, :cell_phone, :birth_date, :sex])
            
    end
end
