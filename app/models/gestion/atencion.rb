require 'state_machines'

class Gestion::Atencion < GestionBase
  belongs_to :usuario
  belongs_to :ingeniero, :class_name => "Gestion::Usuario"
  has_many :eventos




  #==================== ESTADOS ================
  state_machine :estado, :initial => :inicial do

    state :inicial do
    end 


    def initialize(options={})
      @estado=:inicial
      super()
    end


    around_transition do |user, transition, block|
      #Se aprovecha para calcular el tiempo transcurrido
      start = Time.now.to_f
      block.call
      @tiempo_transcurrido ||= 0.00
      @tiempo_transcurrido += Time.now.to_f - start

    end

    event :registra do
      transition :inicial => :registrado
    end

    event :agenda do
      transition :registrado => :agendado
    end

    event :anfitriona do
      transition :agendado => :visitado
    end


    event :reset do
      transition any => :inicial
    end

  end

end

