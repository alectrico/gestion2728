require 'prawn'
require 'prawn/measurement_extensions'


#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Presupuesto::FotosController < PresupuestoController
 
  before_action :authenticate_user!
  before_action :auditor_user
  #ttp_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :set_presupuesto_foto, only: [:show, :edit, :update, :destroy, :download_pdf]

  # GET /@presupuesto_fotos
  # GET /@presupuesto_fotos.json
  def index
    @presupuesto_fotos= Presupuesto::Foto.all

    respond_to do |format|
      format.html {}
      format.json do
	@search = Array.new
        @presupuesto_fotos.each{ |f| @search << { "title" => f.descripcion, "url" => '/presupuesto/fotos/' + f.id.to_s}}
	render json: @search
      end
    end
  end


  # GET /@presupuesto_fotos/1
  # GET /@presupuesto_fotos/1.json
  def show
  end

  # GET /@presupuesto_fotos/new
  def new
    @presupuesto_foto = Presupuesto::Foto.new
  end

 # GET /@presupuesto_fotos/1/edit
  def edit
  end

 # POST /@presupuesto_foto
 # POST /@presupuesto_foto.json
  def create
    @presupuesto_foto=Presupuesto::Foto.new(presupuesto_foto_params)

    @presupuesto_foto.save!

    respond_to do |format|
      if @presupuesto_foto.save
	format.html { redirect_to  @presupuesto_foto, notice: 'Presupuesto_foto  se guardó con éxito.' }
	format.json { render :show, status: :created, location:  @presupuesto_foto }
      else
	format.html do
	  redirect_back(fallback_location: root_path)
	end
	format.json { render json: @presupuesto_foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@presupuesto_fotos/1
  # PATCH/PUT /@presupuesto_fotos/1.json
  def update
    respond_to do |format|
      if @presupuesto_foto.update(presupuesto_foto_params)
        format.html { redirect_to @presupuesto_foto, notice: 'Presupuesto_foto fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @presupuesto_foto }
      else
        format.html { render :edit }
        format.json { render json: @presupuesto_foto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@presupuesto_fotos/1
  # DELETE /@presupuesto_fotos/1.json
  def destroy
    @presupuesto_foto.destroy
    respond_to do |format|
      format.html { redirect_to presupuesto_fotos_url, notice: 'presupuesto_foto fue eliminado.' }
      format.json { head :no_content }
    end
  end

  def download_pdf
     send_data generate_pdf(@presupuesto_foto),
       filename: "#{@presupuesto_foto.descripcion}.pdf",
       type: "application/pdf"
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
    foto_url = registro.image.path	     
    conformidad.foto(foto_url)
    conformidad.save_as("descripcion.pdf")
    conformidad.render
  end



  #GET /fotos/code_image
  def code_image
    @image_data = Presupuesto::Foto.find(params[:id])
    @imagen      = @image_data.bits
    send_data @imagen, :filename => @image_data.nombre_archivo, :content_type => @image_data.tipo_contenido, :status => '200', :type => @image_data.tipo_contenido
  end  



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presupuesto_foto
      @presupuesto_foto =Presupuesto::Foto.all.find(params[:id]) 
      #Le he agregao all porque sino arroja error de procedimiento almacenado
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def presupuesto_foto_params
     # params.require(:presupuesto_foto).permit(:image_file, :descripcion ,:lugar)
      params.permit(:image_file)
#:tipo_contenido, :nombre_archivo, :bits,  :tempfile, :image_uid, :image_name
#thumbnail,  :fotolizable_id, :fotolizable_type, :cv_id, :presupuesto_id,
    end




end
