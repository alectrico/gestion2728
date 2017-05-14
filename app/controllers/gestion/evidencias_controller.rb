




#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::EvidenciasController < GestionController
  before_action :authenticate_user!
  before_action :prohibido, only: [:new]
  before_action :auditor_user
  #http_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :set_gestion_evidencia, only: [:show, :edit, :update, :destroy]
  before_action :set_listas, only: [:new, :edit]
  
  # GET /@gestion_evidencias
  # GET /@gestion_evidencias.json

  def index
    @gestion_evidencias= Gestion::Evidencia.all.where('usuario_id = ?',current_user.perfil_id) unless current_user.admin
    @gestion_evidencias=Gestion::Evidencia.all if current_user.admin

    respond_to do |format|
      format.html
      format.xml  { render  xml: @gestion_evidencias}
      format.json do
         render json: @gestion_evidencias.map{|u| ["title"  => "#{u.descripcion}", "url" => gestion_evidencia_path(u)]}.flatten
      end
    end
  end


  # GET /@gestion_evidencias/1
  # GET /@gestion_evidencias/1.json
  def show
  end

  # GET /@gestion_evidencias/new
  def new
    @gestion_evidencia = Gestion::Evidencia.new
  end

 # GET /@gestion_evidencias/1/edit
  def edit
  end

 # POST /@gestion_evidencia
 # POST /@gestion_evidencia.json
  def create
    @gestion_evidencia=Gestion::Evidencia.new(gestion_evidencia_params)

    respond_to do |format|
      if @gestion_evidencia.save

	#rmat.html { redirect_to  @gestion_evidencia, notice: 'Gestion_evidencia se guardó con éxito.' }
	format.html { redirect_back fallback_location: @gestion_evidencia, notice: 'Gestion_evidencia se guardó con éxito.' }

	format.json { render :show, status: :created, location:  @gestion_evidencia }
	format.js {}
      else
	format.html { render :new }
	format.json { render json: @gestion_evidencia.errors, status: :unprocessable_entity }
	format.js {}
      end
    end
  end

  # PATCH/PUT /@gestion_evidencias/1
  # PATCH/PUT /@gestion_evidencias/1.json
  def update
    respond_to do |format|
      if @gestion_evidencia.update(gestion_evidencia_params)
        format.html { redirect_to @gestion_evidencia, notice: 'Gestion_evidencia fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @gestion_evidencia }
      else
        format.html { render :edit }
        format.json { render json: @gestion_evidencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_evidencias/1
  # DELETE /@gestion_evidencias/1.json
  def destroy
    @gestion_evidencia.destroy
    respond_to do |format|
      format.html { redirect_to gestion_evidencias_url, notice: 'gestion_evidencia fue eliminado.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  def download_pdf
     registro= Gestion::Evidencia.find(params[:id])
     send_data generate_pdf(registro),
         filename: "evidencia#{registro.descripcion}.pdf",
             type: "aplication/pdf"
  end


  def generate_pdf(registro)
    @registro = registro
    conformidad = Prawn::Conformidad.new("registro")
    conformidad.layout
=begin
    presentacion.say_hello(@gestion_registro)
    presentacion.say_direccion(@gestion_registro)
    presentacion.say_detalles(@gestion_registro)
    presentacion.franja
=end
    foto_url = registro.imagen.path
    conformidad.foto(foto_url)
    conformidad.save_as("evidencia_#{registro.descripcion}.pdf")
    conformidad.render
  end


  #GET /fotos/code_image
  def code_image
    @image_data = Gestion::Evidencia.find(params[:id])
    if stale?(:last_modified => @image_data.updated_at.utc, :etag => @image_data)
      @image      = @image_data.bits
      send_data @image, :filename => @image_data.nombre_archivo, :content_type => @image_data.tipo_contenido, :status => '200', :type => @image_data.tipo_contenido
    end
  end



private

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
  end




  def set_listas #Se preparan las listas de los dropdownbox
    raise "Debe llamar antes a set_gestion_evidencia" unless @gestion_evidencia
    @gestion_criterios = @gestion_evidencia.auditoria.tipo_auditoria.criterios
    
    #@gestion_auditorias= Gestion::Auditoria.all.where(:usuario_id => current_user.perfil_id)
    @gestion_auditoria = @gestion_evidencia.auditoria
    #Las auditorias son asignadas a perfiles en vez de a usuarios en carne
    @gestion_usuarios = Gestion::Usuario.all.where(:user_id => current_user.id) unless current_user.admin
    @gestion_usuarios = Gestion::Usuario.all if current_user.admin

  end

    # Use callbacks to share common setup or constraints between actions.
  def set_gestion_evidencia
    @gestion_evidencia =Gestion::Evidencia.find(params[:id]) 
    unless current_user.perfil_id == @gestion_evidencia.usuario.id
      flash[:notice] = "Ud no figura como el usuario que subió esta evidencia"
      redirect_back(:fallback_location => root_path) 
    end
  end


    # Never trust parameters from the scary internet, only allow the white list through.
  def gestion_evidencia_params
    # params.permit(:imagen_file)
    # params.require(:gestion_evidencia).permit(:image_file,:auditoria_id, :criterio_id, :usuario_id, :descripcion, :lugar)
    params.require(:gestion_evidencia).permit(:auditoria_id, :criterio_id, :usuario_id, :imagen_file, :imagen, :imagen_uid, :imagen_name, :tipo_contenido, :nombre_archivo, :bits, :thumbnail, :tempfile, :descripcion, :lugar, :estado, )
  end



end
