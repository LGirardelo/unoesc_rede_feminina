class ProfissionalsController < ApplicationController
  before_action :set_profissional, only: [:show, :edit, :update, :destroy]

  # GET /profissionals
  # GET /profissionals.json
  def index
    #@profissionals = Profissional.all
    @profissionals = Profissional.joins(:person).all
  end

  # GET /profissionals/1
  # GET /profissionals/1.json
  def show
  end

  # GET /profissionals/new
  def new
    @person = Person.new
    @profissional = Profissional.new
    @profissional.person = @person

  end

  # GET /profissionals/1/edit
  def edit
  end

  # POST /profissionals
  # POST /profissionals.json
  def create
    @profissional = Profissional.new(profissional_params)

    respond_to do |format|
      if @profissional.save
        format.html { redirect_to @profissional, notice: 'Profissional was successfully created.' }
        format.json { render :show, status: :created, location: @profissional }
      else
        format.html { render :new }
        format.json { render json: @profissional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profissionals/1
  # PATCH/PUT /profissionals/1.json
  def update
    respond_to do |format|
      @person = @profissional.person
      if @person.update(profissional_params[:person_attributes])
          if profissional_params[:specialization].present?
            @profissional.update_attributes(:specialization => profissional_params[:specialization])
            format.html { redirect_to @profissional, notice: 'Profissional was successfully updated.' }
            format.json { render :show, status: :ok, location: @profissional }
          else
            format.html { render :edit }
            format.json { render json: @profissional.errors, status: :unprocessable_entity }
          end

      end
    end
  end

  # DELETE /profissionals/1
  # DELETE /profissionals/1.json
  def destroy
    @profissional.person.destroy
    @profissional.destroy
    respond_to do |format|
      format.html { redirect_to profissionals_url, notice: 'Profissional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profissional
      #@profissional = Profissional.find(params[:id])
      @profissional = Profissional.joins(:person).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profissional_params
      #params.fetch(:profissional, {})
      params.require(:profissional).permit(:specialization, person_attributes:[:name, :cpf, :rg, :home_phone, :cell_phone, :birth_date, :sex])

    end
end
