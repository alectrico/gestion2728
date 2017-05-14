class Prawn::Conformidad
  include Prawn::View

  def initialize(name)
    @name = name
  end

  def foto(foto_url)
    bounding_box([1.cm,15.cm], :width => 13.cm, :height => 25.cm) do
       image foto_url, :width => 5.cm
    end
  end 

  def layout
      bounding_box([1.cm,25.cm], :width => 13.cm, :height => 2.5.cm) do
        image "#{Rails.root}/app/assets/images/brand/fondocuatricolorcon2728.png",:width => 13.cm,:height => 2.5.cm
      end
      bounding_box([14.cm, 25.cm], :width => 4.cm, :height => 2.5.cm) do
        image "#{Rails.root}/app/assets/images/brand/logo2728.png",:width => 4.cm,:height => 2.5.cm
      end
      fill_color "ffffcc"
      fill_rounded_rectangle   [1.cm,  22.3.cm], 8.cm, 5.cm, 3.mm
      stroke_rounded_rectangle   [10.cm, 22.3.cm], 8.cm, 5.cm, 3.mm
  end

  def franja
    self.line_width = 5
    fill_color "ff0000"
    fill_rectangle [1.cm,100], 500, 100
    fill_color "000000"
    stroke_color "ffffff"
    base_x = 4.5.cm
     [[0.5, 1], 0.5, [1, 0.5]].each do |args|
       transparent(*args) do
        fill_circle [base_x, 100], 50
        stroke_rectangle [base_x - 20, 100], 40, 80
       end
       base_x += 150
     end
  end

  def say_hello(registro)
    fill_color "000000"
    stroke_color "000000"
    bounding_box([2.cm,21.3.cm], :width => 6.cm, :height => 3.7.cm) do
      text " #{registro.nombre_fantasia}",:size => 16, :style => :bold
    end
  end

  def say_direccion(registro)
    fill_color "000000"
    stroke_color "000000"
    bounding_box([11.cm,21.3.cm], :width => 6.cm, :height => 3.7.cm) do
      text " #{registro.razon_social}",:size => 12,:style => :bold
      text " #{registro.rut}-#{registro.dv}",:size => 11
      text " #{registro.direccion} #{registro.comuna}",:size => 11
      text " #{registro.fono}", :size => 11
      text " #{registro.email}", :size => 11
    end
  end

  def say_detalles(registro)

    fill_color "000000"
    stroke_color "000000"
    bounding_box([2.cm,16.cm], :width => 16.cm, :height => 20.cm) do
      text " #{registro.presentacion}", :size => 11
    end
  end

  def say_criterio(registro)

    fill_color "000000"
    stroke_color "000000"
    if registro.directriz
      bounding_box([2.cm,16.cm], :width => 10.cm, :height => 20.cm) do
	text " Directriz para ", :size => 12, :style => :bold
      end
    end

    bounding_box([5.cm,16.cm], :width => 10.cm, :height => 20.cm) do
      text " #{registro.type}", :size => 12, :style => :bold
    end

    bounding_box([2.cm,14.cm], :width => 2.cm, :height => 20.cm) do
      text " #{registro.numeral}", :size => 11, :style => :bold
    end

    bounding_box([4.cm,14.cm], :width => 10.cm, :height => 20.cm) do
      text " #{registro.texto}", :size => 11
    end


  end



end
