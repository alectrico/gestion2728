#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::AuditoriasController < GestionController
  before_action :authenticate_user!
  before_action :prohibido,            only: [:edit,:update]
  before_action :admin_user!,         except: [:show,:index,:edit]
  before_action :auditor_user,          only: [:show,:index,:edit]
  around_action :wrap_in_transaction,   only: [:destroy]
  before_action :set_gestion_auditoria, only: [:show, :update,:destroy]

  # GET /@gestion_auditorias
  # GET /@gestion_auditorias.json
  def index
    @max_criterios = Gestion::Criterio.count.to_f #para encontrar el maximo de la barra de porcentaje
    if current_user.admin?
      @gestion_auditorias= Gestion::Auditoria.all
    else 
      @gestion_auditorias= Gestion::Auditoria.where(:usuario_id => current_user.perfil_id) 
    end
    respond_to do |format|
      format.html
      format.xml  { render  xml: @gestion_auditorias}
      format.json { render json: @gestion_auditorias.map{|u| ["title"  => "#{u.registro.razon_social} (#{u.registro.nombre_fantasia})", "url" => gestion_auditoria_path(u)]}.flatten }
    end
  end


  # GET /@gestion_auditorias/1
  # GET /@gestion_auditorias/1.json
  def show
    @usuario  = @gestion_auditoria.usuario
    @registro = @gestion_auditoria.registro
    @gestion_evidencias = @gestion_auditoria.evidencias
    @gestion_evidencias_huerfanas = Gestion::Evidencia.huerfana.all
    @gestion_criterios = Gestion::Criterio.where(:tipo_auditoria_id => @gestion_auditoria.tipo_auditoria_id)
  end

  # GET /@gestion_auditorias/new
  def new
    @gestion_auditoria = Gestion::Auditoria.new
    @gestion_usuarios  = Gestion::Usuario.all
    @gestion_registros = Gestion::Registro.all
    @gestion_tipo_auditorias = Gestion::TipoAuditoria.all

  end

 # GET /@gestion_auditorias/1/edit
  def edit
    @gestion_usuarios  = Gestion::Usuario.all
    @gestion_registros = Gestion::Registro.all
    @gestion_tipo_auditorias = Gestion::TipoAuditoria.all

  end

 # POST /@gestion_auditoria
 # POST /@gestion_auditoria.json
  def create
    @gestion_auditoria=Gestion::Auditoria.new(gestion_auditoria_params)

    respond_to do |format|
      if @gestion_auditoria.save
	@gestion_auditoria.registro.inicia_auditoria
	format.html { redirect_to  @gestion_auditoria, notice: 'Gestion_auditoria se guardó con éxito.' }
	format.json { render :show, status: :created, location:  @gestion_auditoria }
      else
	format.html { render :new }
	format.json { render json: @gestion_auditoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@gestion_auditorias/1
  # PATCH/PUT /@gestion_auditorias/1.json
  def update
    respond_to do |format|
      if @gestion_auditoria.update(gestion_auditoria_params)
        format.html { redirect_to @gestion_auditoria, notice: 'Gestion_auditoria fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @gestion_auditoria }
      else
        format.html { render :edit }
        format.json { render json: @gestion_auditoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_auditorias/1
  # DELETE /@gestion_auditorias/1.json
  def destroy

    if @gestion_auditoria
    reg=@gestion_auditoria.registro 
    @gestion_auditoria.destroy
    reg.intenta_finalizar_auditoria if reg
    end
    respond_to do |format|
      format.html { redirect_to gestion_auditorias_url, notice: 'gestion_auditoria fue eliminado.' }
      format.json { head :no_content }
    end
  end

  def download_pdf
     registro= Gestion::Auditoria.find(params[:id])
     send_data generate_pdf(registro),
         filename: "#{registro.usuario.nombre}.pdf",
             type: "aplication/pdf"
  end


  def generate_pdf(registro)
    Prawn::Document.new do
      text "#{registro.usuario.nombre}", align: :center
      
        text " Auditor:#{registro.usuario.nombre}"
      
        text " Registro:#{registro.registro.razon_social}"
      
    end.render
  end








  private
    def wrap_in_transaction
      ActiveRecord::Base.transaction do
	begin
          yield
        rescue
          raise ActiveRecord::Rollback
	end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_gestion_auditoria
      #gestion_auditoria =Gestion::Auditoria.includes(:registro,:usuario).limit(1).find(params[:id]) 
      @gestion_auditoria =Gestion::Auditoria.find(params[:id])
      #Le he agregado all porque sino arroja error de procedimiento almacenado
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_auditoria_params
      params.require(:gestion_auditoria).permit(:usuario_id, :registro_id, :tipo_auditoria_id, :remember_token)
    end



end
