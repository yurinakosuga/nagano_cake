class OrderDetail < ApplicationRecord
  enum making_status: {
    cannot_be_manufactured: 0, 
    waiting_for_production: 1, 
    production: 2,
    production_completed: 3
    }
end
