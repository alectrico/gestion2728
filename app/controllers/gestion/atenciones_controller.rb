#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::AtencionesController < GestionController

# http_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :authenticate_user!
  before_action :ingeniero_user
  before_action :hay_ingeniero
  before_action :set_gestion_atencion, only: [:show, :edit, :update, :destroy]

  # GET /@gestion_atenciones
  # GET /@gestion_atenciones.json
  def index
    if current_user.ingeniero
    @gestion_atenciones= Gestion::Atencion.where(:ingeniero => current_user.usuario)
    elsif current_user.admin
      @gestion_atenciones = Gestion::Atencion.all
    end
    #d
    respond_to do |format|
      format.html
      format.xml  { render  xml: @gestion_atenciones}
      format.json { render json: @gestion_atenciones.map{|u| ["title"  => "#{u.estado} (#{u.usuario.nombre})", "url" => gestion_atencion_path(u)]}.flatten}
    end
  end


  # GET /@gestion_atenciones/1
  # GET /@gestion_atenciones/1.json
  def show
    @gestion_eventos = @gestion_atencion.eventos
  end

  # GET /@gestion_atenciones/new
  def new
    @gestion_atencion = Gestion::Atencion.new
  end

 # GET /@gestion_atenciones/1/edit
  def edit
  end

 # POST /@gestion_atencion
 # POST /@gestion_atencion.json
  def create
    #Un usuario puede crear una atención, pero en general se le asgina a un ingeneiero, al crear cada evento
    @gestion_atencion=Gestion::Atencion.new(gestion_atencion_params)
    @gestion_atencion.usuario_id =current_user.perfil_id
    respond_to do |format|
      if @gestion_atencion.save
	format.html { redirect_to  @gestion_atencion, notice: 'Gestion_atencion se guardó con éxito.' }
	format.json { render :show, status: :created, location:  @gestion_atencion }
      else
	flash[:notice] = "Ocurrió un error al intentar guardar la atención"
	format.html { render :new }
	format.json { render json: @gestion_atencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@gestion_atenciones/1
  # PATCH/PUT /@gestion_atenciones/1.json
  def update
    respond_to do |format|
      if @gestion_atencion.update(gestion_atencion_params)
        format.html { redirect_to @gestion_atencion, notice: 'Gestion_atencion fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @gestion_atencion }
      else
        format.html { render :edit }
        format.json { render json: @gestion_atencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_atenciones/1
  # DELETE /@gestion_atenciones/1.json
  def destroy
    @gestion_atencion.destroy
    respond_to do |format|
      format.html { redirect_to gestion_atenciones_url, notice: 'gestion_atencion fue eliminado.' }
      format.json { head :no_content }
    end
  end

  def download_pdf
     registro= Gestion::Atencion.find(params[:id])
     send_data generate_pdf(registro),
         filename: "#{registro.estado}.pdf",
         type: "aplication/pdf"
  end


  def generate_pdf(registro)
    Prawn::Document.new do
      text "#{registro.estado}", align: :center
      text " Estado:#{registro.estado}"
    end.render
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gestion_atencion
      @gestion_atencion =Gestion::Atencion.all.find(params[:id]) 
      #Le he agregao all porque sino arroja error de procedimiento almacenado
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_atencion_params
      params.require(:gestion_atencion).permit(:estado, )
    end



end
