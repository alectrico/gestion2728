#!/home/alex/.rvm/rubies/ruby-2.3.0/bin/ruby

require 'csv'
require 'active_record'
require_relative 'application_record.rb'
require_relative 'gestion.rb'
require_relative 'registro.rb'

ActiveRecord::Base.establish_connection(
  :adapter  => 'postgresql',
  :database => 'gestion2728',
  :username => 'mooc_user',
  :password => '1',
  :host     => 'localhost')




  path2archivo='./registro.csv'

   REGION=0 #exto 10
   RUT   =1 #in5
   DV    =2 #char 1
   RAZON_SOCIAL=3 #texto 200
   NOMBRE_FANTASIA=4 #texto 150
   DIRECCION = 5  #texto 150
   COMUNA=6       #texto 20
   FONO=7         #texto 13
   COMPORTAMIENTO=8 #texo 30
   MAIL=9         #texto 100
   MAIL2=10       #texto 100
  
  Gestion::Registro.delete_all 
 CSV.foreach(path2archivo) do |row|
  STDOUT << row[RAZON_SOCIAL] 
  r=Gestion::Registro.new(:region => row[REGION],:rut => row[RUT] ,:dv=> row[DV][0], :razon_social=> row[RAZON_SOCIAL],:nombre_fantasia => row[NOMBRE_FANTASIA],:direccion=>row[DIRECCION],:comuna=> row[COMUNA],:fono=> row[FONO],:comportamiento=>row[COMPORTAMIENTO],:email=>row[MAIL], :email_secundario => row[MAIL])
  r.save!
 end

    
    

