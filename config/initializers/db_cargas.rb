#ttp://www.ostinelli.net/setting-multiple-databases-rails-definitive-guide/
DB_CARGAS = YAML::load(ERB.new(File.read(Rails.root.join("config","database_cargas.yml"))).result)[Rails.env]

