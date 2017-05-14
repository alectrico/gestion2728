
#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::CriteriosController < GestionController
  before_action :authenticate_user!
  before_action :ingeniero_user, only: [:create, :destroy, :edit, :update]
  before_action :hay_ingeniero, only: [:create, :destroy,:edit, :update]
  #ttp_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :set_gestion_criterio, only: [:show, :edit, :update, :destroy]

  # GET /@gestion_criterios
  # GET /@gestion_criterios.json
  def index
    @gestion_criterios= Gestion::Criterio.all
    respond_to do |format|
      format.html
      format.xml  { render  xml: @gestion_criterios}
      format.json do
=begin
        @search=Array.new
        @gestion_criterios.each_with_index do |registro|
          @search << {"title" =>registro.numeral,"url" => '/gestion/evidencias/'+registro.id.to_s}
          @search << {"title" =>registro.texto,"url" => '/gestion/evidencias/'+registro.id.to_s} 
        end
=end
        #ender json: @gestion_criterios.map(|registro| registro_numeral )
	render json: @gestion_criterios.map{|u| ["title"  => u.texto, "url" => gestion_criterio_path(u)]}.flatten


      end 
    end
  end


  # GET /@gestion_criterios/1
  # GET /@gestion_criterios/1.json
  def show
  end

  # GET /@gestion_criterios/new
  def new
    @gestion_criterio = Gestion::Criterio.new
  end

 # GET /@gestion_criterios/1/edit
  def edit
    @gestion_tipo_auditorias = Gestion::TipoAuditoria.all
  end

 # POST /@gestion_criterio
 # POST /@gestion_criterio.json
  def create
    @gestion_criterio=Gestion::Criterio.new(gestion_criterio_params)

    respond_to do |format|
      if @gestion_criterio.save
	format.html { redirect_to  gestion_criterio_path(@gestion_criterio.id), notice: 'Gestion_criterio se guardó con éxito.' }
	format.json { render :show, status: :created, location:  gestion_criterio_path(@gestion_criterio.id) }
	format.js {}
      else
	format.html { render :new }
	format.json { render json: @gestion_criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@gestion_criterios/1
  # PATCH/PUT /@gestion_criterios/1.json
  def update
    respond_to do |format|
      if @gestion_criterio.update(gestion_criterio_params)
        format.html { redirect_to gestion_criterio_path(@gestion_criterio.id), notice: 'Gestion_criterio fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: gestion_criterio_path(@gestion_criterio.id) }
      else
        format.html { render :edit }
        format.json { render json: @gestion_criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_criterios/1
  # DELETE /@gestion_criterios/1.json
  def destroy
    @gestion_criterio.destroy
    respond_to do |format|
      format.html { redirect_to gestion_criterios_url, notice: 'gestion_criterio fue eliminado.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  def download_pdf
     registro= Gestion::Criterio.find(params[:id])
     send_data generate_pdf(registro),
         filename: "#{registro.type}#{registro.numeral}.pdf",
             type: "aplication/pdf"
  end


  def generate_pdf(registro)
    @registro = registro
    conformidad = Prawn::Conformidad.new("registro")
    conformidad.layout
    
    @gestion_registro = Gestion::Registro.first
    conformidad.say_hello(@gestion_registro)
    conformidad.say_direccion(@gestion_registro)
    conformidad.say_criterio(registro)
    conformidad.franja
    conformidad.save_as("#{registro.type}#{registro.numeral}.pdf")
    conformidad.render
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gestion_criterio
      @gestion_criterio =Gestion::Criterio.all.find(params[:id]) 
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_criterio_params
      if params[:gestion_politica]
        params.require(:gestion_politica).permit(:type, :numeral, :texto, :directriz,:tipo_auditoria_id )

      elsif params[:gestion_procedimiento]
        params.require(:gestion_procedimiento).permit(:type, :numeral, :texto, :directriz,:tipo_auditoria_id )

      elsif params[:gestion_requisito]
        params.require(:gestion_requisito).permit(:type, :numeral, :texto, :directriz,:tipo_auditoria_id )

      else
        params.require(:gestion_criterio).permit(:type, :numeral, :texto, :directriz,:tipo_auditoria_id )
      end
    end



end
