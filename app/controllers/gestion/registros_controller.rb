require 'prawn'
require 'prawn/measurement_extensions'




#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::RegistrosController < GestionController

  before_action :authenticate_user!
  before_action :admin_user!
  #ttp_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :set_gestion_registro, only: [:show, :edit, :update, :destroy,:enviar_presentacion, :download_pdf]
  before_action :restrict, only: [:index]



  def search
      @gestion_registro =Gestion::Registro.readonly.all.find_by_razon_social(params[:razon_social])
      
      respond_to do |format|
        format.json { render json: @gestion_registro}
      end
  end

  # GET /@gestion_registros
  # GET /@gestion_registros.json
  def index
    respond_to do |format|
      format.html
      format.xml  { render  xml: @gestion_registros}
      format.json { render json: @gestion_registros.map{|u| ["title"  => "#{u.razon_social} (#{u.nombre_fantasia})", "url" => gestion_registro_path(u)]}.flatten}
    end
  end


  # GET /@gestion_registros/1
  # GET /@gestion_registros/1.json
  def show
  end

  # GET /@gestion_registros/new
  def new
    @gestion_registro = Gestion::Registro.new
  end

 # GET /@gestion_registros/1/edit
  def edit
  end

 # POST /@gestion_registro
 # POST /@gestion_registro.json
  def create
    @gestion_registro=Gestion::Registro.new(gestion_registro_params)

    respond_to do |format|
      if @gestion_registro.save
	format.html { redirect_to  @gestion_registro, notice: 'Gestion_registro se guardó con éxito.' }
	format.json { render :show, status: :created, location:  @gestion_registro }
      else
	format.html { render :new }
	format.json { render json: @gestion_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@gestion_registros/1
  # PATCH/PUT /@gestion_registros/1.json
  def update
    respond_to do |format|
      if @gestion_registro.update(gestion_registro_params)
        format.html { redirect_to @gestion_registro, notice: 'Gestion_registro fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @gestion_registro }
      else
        format.html { render :edit }
        format.json { render json: @gestion_registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_registros/1
  # DELETE /@gestion_registros/1.json
  def destroy
    @gestion_registro.destroy
    respond_to do |format|
      format.html { redirect_to gestion_registros_url, notice: 'gestion_registro fue eliminado.' }
      format.json { head :no_content }
    end
  end


  def enviar_presentacion
    Gestion::UsuarioMailer.enviar_presentacion(@gestion_registro).deliver
    
    @gestion_registro.presentacion = :presentada

    if @gestion_registro.save
      respond_to do |format|
	format.html do
	  flash[:notice] = "Presentacion Enviada"
	  redirect_back(fallback_location: root_path)
	end
      end
    end

  end

  def download_pdf
     send_data generate_pdf(@gestion_registro),
       filename: "#{@gestion_registro.razon_social}.pdf",
       type: "application/pdf"
  end


  def generate_pdf(registro)
    presentacion = Prawn::Presentacion.new("registro")
    presentacion.layout
    presentacion.say_hello(@gestion_registro)
    presentacion.say_direccion(@gestion_registro)
    presentacion.say_detalles(@gestion_registro)
    presentacion.franja
    presentacion.save_as("#{@gestion_registro.razon_social}.pdf")
    presentacion.render
  end

  private

    def notifica(&block)
      yield if block_given?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_gestion_registro
      @gestion_registro = Gestion::Registro.all.find(params[:id]) 
      #Le he agregao all porque sino arroja error de procedimiento almacenado
    end

    def restrict
      if params[:en_auditoria]
        @gestion_registros = Gestion::Registro.all.en_auditoria
      elsif params[:auditoria_finalizada]
        @gestion_registros = Gestion::Registro.all.auditoria_finalizada
      elsif params[:presentada]
        @gestion_registros = Gestion::Registro.all.presentada
      elsif params[:no_presentada]
        @gestion_registros = Gestion::Registro.all.no_presentada
      else
	@gestion_registros = Gestion::Registro.includes({auditorias: :evidencias }  )
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_registro_params
      params.require(:gestion_registro).permit(:region, :rut, :dv, :razon_social, :nombre_fantasia, :direccion, :comuna, :fono, :comportamiento, :email, :email_secundario, )
    end



end
