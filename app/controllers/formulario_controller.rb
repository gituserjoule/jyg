class FormularioController < ApplicationController
  def post
   @const = "+549"

   @respuesta = false;
   if request.post?
      @abuscar = {
        :celular => params[:celular]
      };
      @codigo = {
        :apellido => params[:apellido]
      };

      aux1 = @codigo[:apellido]
      aux = @abuscar[:celular]
      @const << aux

   #if Usuario.where([' cel = ? ', @const]).exists?
   if Usuario.where([' activo = ?  AND  cel = ? ', 0 , @const])
    Usuario.where([' cel = ? ', @const]).each { |u| u.update_attributes(activo: '1') }
    Usuario.where([' cel = ? ', @const]).each { |u| u.update_attributes(:apellido => aux1) }
   end
   if Usuario.where([' activo = ?  AND  cel = ? ', 1 , @const])
    Usuario.where([' cel = ? ', @const]).each { |u| u.update_attributes(activo: '0') }
    Usuario.where([' cel = ? ', @const]).each { |u| u.update_attributes(:apellido => aux1) }
    #redirect_to(:controller=>'usuarios', :action=>'index')
   end
   redirect_to(:controller=>'usuarios', :action=>'update')
   #else
    #redirect_to(:controller=>'usuarios', :action=>'new')

   end
end
end
