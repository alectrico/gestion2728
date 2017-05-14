#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::EventosController < GestionController
 
  before_action :authenticate_user!
  before_action :hay_ingeniero

  #http_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :set_gestion_evento, only: [:show, :edit, :update, :destroy]
  #around_action :wrap_in_transaction, only: [:create]


  # GET /@gestion_eventos
  # GET /@gestion_eventos.json
  def index
    #Cada user puede ver los eventos en los que ha sido elegido como responsable
    #El admin puede verlos todos
    if current_user.admin or current_user.ingeniero
      @gestion_eventos= Gestion::Evento.all if current_user.admin or current_user.ingeniero
    elsif
      @gestion_eventos= Gestion::Evento.where(:usuario_id => current_user.perfil_id) 
    end
    respond_to do |format|
      format.html
      format.xml  { render  xml: @gestion_eventos}
      format.json { render json: @gestion_eventos.map{|u| ["title"  => "#{u.titulo} (#{u.descripcion})", "url" => gestion_evento_path(u)]}.flatten}
    end
  end


  # GET /@gestion_eventos/1
  # GET /@gestion_eventos/1.json
  def show
  end

  # GET /@gestion_eventos/new
  def new
    @gestion_evento = Gestion::Evento.new
  end

 # GET /@gestion_eventos/1/edit
  def edit
  end

 # POST /@gestion_evento
 # POST /@gestion_evento.json
  def create
   #" current_user.perfil_id.nil?
   #   perfil = Gestion::Usuario.create(:email => current_user.email, :nombre => current_user.name) 
   #   perfil.user = current_user
   #   perfil.save!
   #en d
   #Es necesario crear un perfil sin intervención del admin
   unless current_user.perfil_id 
     perfil = Gestion::Usuario.new(:nombre => current_user.name,:email=> current_user.email + ".2728.cl",:activo => true)
     perfil.user = current_user
     perfil.save!
   end


  # @gestion_evento = current_user.usuario.eventos.create(gestion_evento_params)
   @ingeniero=User.ingeniero.last.usuario
   @ingeniero_perfil= User.ingeniero.last.usuario
  
   @gestion_atencion = Gestion::Atencion.find_or_create_by(:usuario => current_user.usuario,:ingeniero => @ingeniero_perfil)
   @gestion_evento = @gestion_atencion.eventos.create(gestion_evento_params) 
   @gestion_evento.ingeniero = @ingeniero_perfil
   @gestion_evento.usuario = current_user.usuario

    respond_to do |format|
      if @gestion_evento.save
        Gestion::UsuarioMailer.evento_nuevo(current_user,@gestion_evento,@ingeniero_perfil).deliver_later
        Gestion::UsuarioMailer.confirmacion_evento_nuevo(current_user,@gestion_evento, @ingeniero_perfil).deliver_later
	format.html { redirect_to  @gestion_evento, notice: 'Gestion_evento se guardó con éxito.' }
	format.json { render :show, status: :created, location:  @gestion_evento }
      else
	flash[:notice]="Error guardando evento"
	format.html { render :edit }
	format.json { render json: @gestion_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@gestion_eventos/1
  # PATCH/PUT /@gestion_eventos/1.json
  def update
    respond_to do |format|
      if @gestion_evento.update(gestion_evento_params)
        format.html { redirect_to @gestion_evento, notice: 'Gestion_evento fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @gestion_evento }
      else
        format.html { render :edit }
        format.json { render json: @gestion_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_eventos/1
  # DELETE /@gestion_eventos/1.json
  def destroy
    @gestion_evento.destroy
    respond_to do |format|
      format.html { redirect_to gestion_eventos_url, notice: 'gestion_evento fue eliminado.' }
      format.json { head :no_content }
    end
  end

  def download_pdf
     registro= Gestion::Evento.find(params[:id])
     send_data generate_pdf(registro),
     filename: "#{registro.titulo}.pdf",
     type: "aplication/pdf"
  end


  def generate_pdf(registro)
    Prawn::Document.new do
      text "#{registro.titulo}", align: :center
      text " Titulo:#{registro.titulo}"
      text " Descripcion:#{registro.descripcion}"
      text " Fecha:#{registro.fecha}"
      text " Email:#{registro.email}"
      text " Direccion:#{registro.direccion}"
      text " Coordenadas:#{registro.coordenadas}"
      #text " Type:#{registro.type}"
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
    def set_gestion_evento
      @gestion_evento =Gestion::Evento.all.find(params[:id])
      unless current_user.perfil_id == @gestion_evento.usuario.id or current_user.admin or current_user.ingeniero
	flash[:notice] = "Ud no es quien subió este evento"
	redirect_back(:fallback_location => root_path)
      end
      #Le he agregao all porque sino arroja error de procedimiento almacenado
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_evento_params
      params.require(:gestion_evento).permit(:titulo, :descripcion, :fecha, :email, :direccion, :coordenadas, :type )
    end



end
