class Gestion::Usuario < GestionBase
 

  logger = Logger.new(STDOUT)
  logger.level = Logger::INFO

  validates :email, :uniqueness => true
  validates :nombre, :presence => true

  has_many :tipo_auditorias, inverse_of: :autor
  #Los users son los usuarios de login, los que pueden borrarse por su propia cuenta, pero lo usuarios son los perfiles que pueden quedar y si quedan permiten econtrar la histori de quien participo en auditorias y subio evidencias. Si los perfiles se borrar, quedarán huérfanas las auditorias y las evidencias. Para que otro las retome.
  has_many :evidencias,     dependent: :destroy, inverse_of: :usuario #las evidencias deben tener un dueño usuario
  has_many :auditorias,     dependent: :destroy, inverse_of: :usuario#las auditorias deben tener un usuario

  has_many :eventos,        dependent: :destroy, inverse_of: :usuario
  has_many :eventos,        inverse_of: :ingeniero

  has_many :atenciones,     dependent: :destroy, inverse_of: :usuario

  belongs_to :user,  inverse_of: :usuario #puede haber usuarios que no tengan registro en user '¿

  dragonfly_accessor :imagen

  def imagen_file=(input_data)
    self.tipo_contenido = input_data.content_type
    self.nombre_archivo = input_data.original_filename
    self.tempfile       = input_data.tempfile
    self.bits           = input_data.read
#    self.imagen         = self.bits.clone
  end
 
  def prepare
    #elf.imagen = self.bits.clone
    #elf.save
    self.update_attributes(:imagen => self.bits.clone) if self.bits
  end



#========================= ESTADOS ==========
  state_machine :estado, :initial => :visitante do
    event :registra do
      transition :visitante => :registrado
      transition :registrado => :registrado
    end

    around_transition do |perfil, transition, block|

      logger.info "Estoy en around transition en usuario (perfil)"
      logger.info "============"
      logger.info perfil.nombre
      logger.info transition.inspect

      start = Time.now.to_f

      #cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      #user[:password_digest] = BCrypt::Password.create(user.password, cost: cost)
      #user[:email] = user.email
      #user[:fono]  = user.fono
      #user[:name]  = user.name
      #user[:estado]= user.estado

      block.call
      @tiempo_transcurrido ||= 0.00
      @tiempo_transcurrido += Time.now.to_f - start
      #ogger.info usuario.tiempo_transcurrido
    end

    event :log_in do
      transition any => :logado
    end

    event :enrola do
      transition :logado => :enrolado
      transition :registrado => :enrolado
    end

    def initialize 
      super()
    end

  end

end
