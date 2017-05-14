class ElectricoBase < ActiveRecord::Base
    self.abstract_class = true

    establish_connection DB_STATS
end
