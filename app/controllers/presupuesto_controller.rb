class PresupuestoController < ApplicationController
  layout 'presupuesto/uno', only: [:new, :show, :edit]
end
