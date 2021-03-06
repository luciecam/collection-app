class TechnicalDetail < ApplicationRecord
  belongs_to :clothe
  belongs_to :component

  after_save  :compute_component_cost
  
  # private
  def compute_component_cost
  # récuperer le prix du composant lié
    component = self.component
    compoUI = component.unit_price.to_f
    # multiplier par sa propre qté (self)
    price = (compoUI * self.quantity).to_f
    # récup l'instance associée de clothe
    # incrémenter cette instance du prix total
    clothe = self.clothe
    clothe.total_cost += price
    # save clothe
    clothe.save 
  end
  

  #def compute_clothe_production_cost
  #  clothe_prod_cost = clothe.total_cost * clothe.quantity
    # clothe.save
  #end


end
