class UsuariosController < ApplicationController

  http_basic_authenticate_with :name => "gabriel", :password => "010101", :except => [:new, :edit, :show, :update]

  def index
    #@usuarios = Usuario.where("updated_at >= ? && created_at <= ?" , Time.now - 2.days , Time.now - 3.days)
    #@usuarios = Usuario.where("created_at >= ?" , Time.now - 2.days)
    #@usuarios = Usuario.where("created_at >= ?" , Time.now - 6.hours)
    @usuarios = Usuario.all()
    respond_to do |format|
      format.html
      format.csv { send_data @usuarios.to_csv }

    end

  end

  def new
    @usuarios = Usuario.new();
  end

  def create
   #Recuperamos las varibles POST que vinieron desde la acción new.
   @constante = "+549"
   @signo = 0


   @apellido = params[:usuario][:apellido]
   @nombre = params[:usuario][:nombre]
   @celular = params[:usuario][:cel]
   @constante << @celular

   if Usuario.where([" cel = ? ", @constante]).exists?


   #if @registro[2] == @constante
      @signo = 1
      redirect_to(:controller=>'usuarios', :action=>'edit')
      #redirect_to usuarios_path, :notice => "Usuario ya registrado"
   end

   #Creamos el objeto con los valores a ingresar.
   @usuarios = Usuario.new({
      :apellido => @apellido,
      :nombre => @nombre,
      :cel => @constante,
      :activo => true
   });


   #Verificamos si la tarea ha podido ser guardado correctamente.
   if @signo == 0
    if @usuarios.save()
       redirect_to(:controller=>'usuarios', :action=>'show')
       #redirect_to usuarios_path, :notice => "El usuario ha sido registrado con éxito"
    else
       render "new";
    end
   end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    @usuarios = Usuario.find(params[:id]);
   if @usuarios.destroy()
      redirect_to usuarios_path, :notice => "El usuario ha sido eliminado";
   else
      redirect_to usuarios_path, :notice => "El usuario NO ha podido ser eliminado";
   end
  end
end
