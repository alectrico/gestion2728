





#Este controlador fue generado por un template ubicado en lib/templates/rails/scaffold_controller/controller.rb

class Gestion::UsuariosController < GestionController
  before_action :authenticate_user!
  before_action :admin_user!, except: [:code_image]
 # http_basic_authenticate_with name: "gope", password: "crisis", except: [:index, :show]
  before_action :set_gestion_usuario, only: [ :show, :edit, :update, :destroy]

  # GET /@gestion_usuarios
  # GET /@gestion_usuarios.json
  def index
    @gestion_usuarios= Gestion::Usuario.all

    respond_to do |format|
      format.html
      format.json do
        render json: @gestion_usuarios.map{|u| ["title"  => "#{u.nombre} (#{u.email})", "url" => gestion_usuario_path(u)]}.flatten
      end
    end
  end


  # GET /@gestion_usuarios/1
  # GET /@gestion_usuarios/1.json
  def show
  end

  # GET /@gestion_usuarios/new
  def new
    @gestion_usuario = Gestion::Usuario.new
    @users = User.all
  end

 # GET /@gestion_usuarios/1/edit
  def edit
    @users = User.all
  end

 # POST /@gestion_usuario
 # POST /@gestion_usuario.json
  def create
    @gestion_usuario=Gestion::Usuario.new(gestion_usuario_params)
    @users = User.all
    if params[:gestion_usuario][:login] == 'auditor'
      @gestion_usuario.user.auditor = true if @gestion_usuario.user
      @gestion_usuario.user.ingeniero = false if @gestion_usuario.user
    elsif params[:gestion_usuario][:login] == 'ingeniero'
      @gestion_usuario.user.auditor = false if @gestion_usuario.user
      @gestion_usuario.user.ingeniero = true if @gestion_usuario.user
    elsif params[:gestion_usuario][:login] == 'profesor'
      @gestion_usuario.user.profesor = true  if @gestion_usuario.user
    else
      @gestion_usuario.user.ingeniero = false
      @gestion_usuario.user.auditor = false  
      @gestion_usuario.user.profesor = false 
    end

    @gestion_usuario.user.save if @gestion_usuario.user

    respond_to do |format|
      if @gestion_usuario.save
	format.html { redirect_to  @gestion_usuario, notice: 'Gestion_usuario se guardó con éxito.' }
	format.json { render :show, status: :created, location:  @gestion_usuario }
      else
	format.html { render :new }
	format.json { render json: @gestion_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /@gestion_usuarios/1
  # PATCH/PUT /@gestion_usuarios/1.json
  def update
    @users = User.all

    if params[:gestion_usuario][:login] == 'auditor'
      @gestion_usuario.user.auditor   = true   if @gestion_usuario.user
      @gestion_usuario.user.ingeniero = false  if @gestion_usuario.user

    elsif params[:gestion_usuario][:login] == 'ingeniero'
      @gestion_usuario.user.auditor   = false  if @gestion_usuario.user
      @gestion_usuario.user.ingeniero = true   if @gestion_usuario.user
    elsif params[:gestion_usuario][:login] == 'profesor'
      @gestion_usuario.user.profesor = true
     else
      @gestion_usuario.user.ingeniero = false  if @gestion_usuario.user
      @gestion_usuario.user.auditor   = false  if @gestion_usuario.user
      @gestion_usuario.user.profesor  = false  
    end

    

    @gestion_usuario.user.save if @gestion_usuario.user



    respond_to do |format|
      if @gestion_usuario.update(gestion_usuario_params)
        format.html { redirect_to @gestion_usuario, notice: 'Gestion_usuario fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @gestion_usuario }
      else
        format.html { render :edit }
        format.json { render json: @gestion_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /@gestion_usuarios/1
  # DELETE /@gestion_usuarios/1.json
  def destroy
    @gestion_usuario.destroy
    respond_to do |format|
      format.html { redirect_to gestion_usuarios_url, notice: 'gestion_usuario fue eliminado.' }
      format.json { head :no_content }
    end
  end

  def download_pdf
     registro= Gestion::Usuario.find(params[:id])
     send_data generate_pdf(registro),
         filename: "#{registro.nombre}.pdf",
             type: "aplication/pdf"
  end


  def generate_pdf(registro)
    Prawn::Document.new do
      text "#{registro.nombre}", align: :center
      
        text " Nombre:#{registro.nombre}"
      
        text " Email:#{registro.email}"
      
        text " Login:#{registro.login}"
      
    end.render
  end



  #GET /fotos/code_image
  def code_image
    @image_data = Gestion::Usuario.find(params[:id])
    if stale?(:last_modified => @image_data.updated_at.utc, :etag => @image_data)
    @image      = @image_data.bits
    send_data @image, :filename => @image_data.nombre_archivo, :content_type => @image_data.tipo_contenido, :status => '200', :type => @image_data.tipo_contenido
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gestion_usuario
      @gestion_usuario =Gestion::Usuario.all.find(params[:id]) 
      #Le he agregao all porque sino arroja error de procedimiento almacenado
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def gestion_usuario_params
      params.require(:gestion_usuario).permit(:user_id,:imagen_file, :nombre, :image_name, :email, :login, :image_file,:activo)
    end



end
