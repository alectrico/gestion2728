





#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::TipoAuditoriasController < GestionController

  #http_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :authenticate_user!
  before_action :ingeniero_user
  before_action :hay_ingeniero
  before_action :set_gestion_tipo_auditoria, only: [:show, :edit, :update, :destroy]

  # GET /@gestion_tipo_auditorias
  # GET /@gestion_tipo_auditorias.json
  def index
    @gestion_tipo_auditorias= Gestion::TipoAuditoria.all

    respond_to do |format|
      format.html
      format.xml  { render  xml: @gestion_tipo_auditorias}
      format.json { render json: @gestion_tipo_auditorias.map{|u| ["title"  => "#{u.nombre}", "url" => gestion_tipo_auditoria_path(u)]}.flatten}
    end

  end


  # GET /@gestion_tipo_auditorias/1
  # GET /@gestion_tipo_auditorias/1.json
  def show
    @gestion_criterios = @gestion_tipo_auditoria.criterios
    #gestion_criterios = Gestion::Criterio.all
  end

  # GET /@gestion_tipo_auditorias/new
  def new
    @gestion_tipo_auditoria = Gestion::TipoAuditoria.new
  end

 # GET /@gestion_tipo_auditorias/1/edit
  def edit
  end

 # POST /@gestion_tipo_auditoria
 # POST /@gestion_tipo_auditoria.json
  def create
    @gestion_tipo_auditoria=Gestion::TipoAuditoria.new(gestion_tipo_auditoria_params)
    @gestion_tipo_auditoria.autor = current_user.usuario
    respond_to do |format|
      if @gestion_tipo_auditoria.save
	format.html { redirect_to  @gestion_tipo_auditoria, notice: 'Gestion_tipo_auditoria se guardó con éxito.' }
	format.json { render :show, status: :created, location:  @gestion_tipo_auditoria }
      else
	format.html { render :new }
	format.json { render json: @gestion_tipo_auditoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@gestion_tipo_auditorias/1
  # PATCH/PUT /@gestion_tipo_auditorias/1.json
  def update
    @gestion_tipo_auditoria.autor = current_user.usuario

    respond_to do |format|
      if @gestion_tipo_auditoria.update(gestion_tipo_auditoria_params)
        format.html { redirect_to @gestion_tipo_auditoria, notice: 'Gestion_tipo_auditoria fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @gestion_tipo_auditoria }
      else
        format.html { render :edit }
        format.json { render json: @gestion_tipo_auditoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_tipo_auditorias/1
  # DELETE /@gestion_tipo_auditorias/1.json
  def destroy
    @gestion_tipo_auditoria.destroy
    respond_to do |format|
      format.html { redirect_to gestion_tipo_auditorias_url, notice: 'gestion_tipo_auditoria fue eliminado.' }
      format.json { head :no_content }
    end
  end

  def download_pdf
     registro= Gestion::TipoAuditoria.find(params[:id])
     send_data generate_pdf(registro),
         filename: "#{registro.nombre}.pdf",
             type: "aplication/pdf"
  end


  def generate_pdf(registro)
    Prawn::Document.new do
      text "#{registro.nombre}", align: :center
      
        text " Nombre:#{registro.nombre}"
      
    end.render
  end








  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gestion_tipo_auditoria
      @gestion_tipo_auditoria =Gestion::TipoAuditoria.all.find(params[:id]) 
      #Le he agregao all porque sino arroja error de procedimiento almacenado
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_tipo_auditoria_params
      params.require(:gestion_tipo_auditoria).permit(:nombre, )
    end



end
