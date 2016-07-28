

post '/register' do
  name = params[:name]
  email = params[:email]
  password = params[:password]
  user = User.new(name: name, email: email, password: password)
  if user.save 
    @bulean = true
    session[:id] = user.id
    redirect to ("/mashups/home")
  end
end

post '/login' do
  @error_message = ""
  email = params[:email]
  password = params[:password]
#buscar si existe el usuario
  user = User.authenticate(email, password)
  if user 
      session[:id] = user.id
      redirect to ("/mashups/home")
  else
#obtener id y email para crear sesión
  @error_message = "Usuario Inválido"
    erb :index
  end
end


get '/logout' do
  session.clear
  @bulean2 = true
  erb :index
end