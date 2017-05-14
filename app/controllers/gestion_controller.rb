class GestionController < ApplicationController
  prepend_view_path 'app/views/gestion'
  layout 'gestion/uno', only: [:new, :show, :edit]
end
