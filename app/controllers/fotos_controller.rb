#encoding: ISO-8859-1
class FotosController < ElectricoController
#before_filter :force_no_ssl
#no puede tener restricciones de acceso

#http://archive.railsforum.com/viewtopic.php?id=4642

#~BAse sde datos de fotos, para cada uario, pueden hacer un curriculum  con ellos
#before_filter :admin_user, only:  [:index]
#efore_filter :admin_user , only: [:new,:delete,:update]
#before_filter :correct_client, only: [:show]


  # GET /fotos
  # GET /fotos.json
  def index
    if !current_user.nil? 
      @fotos = Foto.where(:user_id == current_user.id)
    end 
    respond_to do |format|
      if !current_user.nil?

        format.html # index.html.erb
        format.json { render json: @fotos }
  
      else

         format.html { redirect_to '/signin',notice: 'Para acceder a las Fotos debe haber ingresado antes con contraseña.' }

      end
    end

  end

  # GET /fotos/1
  # GET /fotos/1.json
  def show
    @foto = Foto.where(:user_id == current_user.id).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foto }
      
      format.js {}
    end
  end

  #GET /fotos/code_image
  def code_image

   #esta parte es para mimemtizar la base de datos en un comportamiento REST, 
   #o sea genera una respuesta http en send_data, aprovechar para Cache-control?
   #@image_data = Foto.where(:user_id == current_user.id).find(params[:id])

   @image_data = Foto.find(params[:id])

   @image = @image_data.bits
  
   #da un problema con protect_for_forgery
   send_data @image,  :filename => @image_data.nombre_archivo,  :content_type => @image_data.tipo_contenido, :status => '200' , :type => @image_data.tipo_contenido

    #, :type => @image_data.tipo_contenido,
    #             :filename => @image_data.nombre_archivo,
    #          :disposition => 'inline')

   #filename es nombre sugerido
   #rm brx fr ìnline puede ser attachment 
   #esta parte es para guardar en un archiov

  end

 
# GET /fotos/new
  # GET /fotos/new.json
  def new
    @foto = Foto.new
    @foto.user_id = current_user.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foto }
    end
  end



  # GET /fotos/1/edit
  def edit
    @foto = Foto.find(params[:id])
  end



 def create_usando_dragonfly_no_guardando_en_base_de_Dats
   @foto = Foto.new(foto_params)
      respond_to do |format|
      if @foto.save then
        format.html { redirect_to @foto,notice: 'Foto was successfully created.' }
        format.json { render json: @foto, status: :created, location: @foto }
      else
        format.html { render action: "new" }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end



 end


  # POST /fotos
  # POST /fotos.json
  def create
    #directory = "public/assets"
    archivo = params[:foto][:image_file]

    #path = File.join(directory,archivo.original_filename)
    #lash[:notice] = path
    #File.open(path, "wb") { |f| f.write(archivo.tempfile.read)}
    
    @foto = Foto.new(foto_params)
    #ogger.debug{archivo.size}
    #3rchivo.tempfile.open
    #3rchivo.tempfile.rewind
    #logger.debug{archivo.tempfile.eof}

    #@foto.bits = archivo.tempfile.read

   saved = @foto.save
   if @foto.fotolizable_id.nil? 
      #session[:return_to] = foto_url(@foto)
      ubicacion = foto_url(@foto)

   else
      
      #ession[:return_to] = presupuesto_url{@foto.fotolizable_id}
      ubicacion = presupuesto_url(@foto.fotolizable_id)
   end
   
      respond_to do |format|
      if saved then
       
        #if @foto.fotolizable_id.nil?

          #format.html { redirect_to @foto,notice: 'Foto was successfully created.' }
        #elsif @foto.id.nil?
         #format.html { redirect_to presupuesto_url(@foto.fotolizable_id)}
         format.html { redirect_to ubicacion }
         #format.html { redirect_to session[:return_to]}
        #end
 
        format.json { render json: @foto, status: :created, location: @foto }

        format.js {}
      else
        format.html { render action: "new" }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
        render js:  alert(@foto.errors)    
      end
    end
   
  end

  # PUT /fotos/1
  # PUT /fotos/1.json
  def update
    @foto = Foto.where(:user_id == current_user.id).find(params[:id])
    directory = "public/assets"
    archivo = params[:foto][:image_file]

    #ath = File.join(directory,archivo.original_filename)
    #flash[:notice] = inspect(archivo)

    respond_to do |format|
      if @foto.update_attributes(foto_params)
        #rmat.html { redirect_to @foto, notice: 'Foto was successfully updated.' }
        format.html { render action: "edit", controller: "presupuesto" }


        format.json { head :no_content }
        format.js {}
      else
        format.html { render action: "edit" }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
        render js:  alert(@foto.errors)
      end
    end
  end

  # DELETE /fotos/1
  # DELETE /fotos/1.json
  def destroy
    @foto = Foto.find(params[:id])
    @foto.destroy

    respond_to do |format|
      format.html { redirect_to fotos_url }
      format.json { head :no_content }
      format.js 
    end
  end

private

def foto_params

  if current_user and current_user.admin?
    params.require(:foto).permit(:presupuesto_id, :id,  :bits, :descripcion, :nombre_archivo, :tipo_contenido, :image_file, :cv_id, :user_id,:thumbnail, :tempfile,:fotolizable_id, :fotolizable_type)
  end

end


end
