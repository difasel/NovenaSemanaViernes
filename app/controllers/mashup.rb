# Show all mashups

get '/mashups/home' do
  erb :mashups_home
end

get '/upvote/:option/' do
  p option = params[:option]
  p num_option = params[:num_option]

  if num_option == "1"
    p mashup = Mashup.find_by(option_1: option)
    p mashup_votes = mashup.votes_1 + 1
    mashup.update(votes_1: mashup_votes)
  elsif num_option == "2"
    p mashup = Mashup.find_by(option_2: option)
    p mashup_votes = mashup.votes_2 + 1
    mashup.update(votes_2: mashup_votes)
  end
  redirect to '/mashups'
end


get '/mashups' do
  @mashups = Mashup.order(:id)
  erb :mashups
end

get '/mashups/search' do
  @mashups = Mashup.order(:id)
  erb :search_mashup
end
# Get to a form to create a new mashups

get '/mashups/new' do
  erb :mashup_form
end

# Submit create button on /mashups/new

post '/mashups/create' do
  p title = params[:title]
  p category = params[:category]
  p option_1 = params[:option_1]
  p option_2 = params[:option_2]
  p image_1 = params[:image_1]
  p image_2 = params[:image_2]

  mashup = Mashup.create(category: category, title: title, option_1: option_1, option_2: option_2, image_1: image_1, image_2: image_2, user_id: current_user.id)
end

# Get a form to create a search

get 'mashups/search' do 
  erb :search_form
end

# Show specific mashup from /mashups/search

get '/mashups/search/:id' do
  id = params[:id]
  p @mashup = Mashup.find(id)
  erb :search_found
end

get '/search_img' do
  search = params[:search]
  # El link que le pasamos al siguiente método se obtiene con googleapis y con un cse (custom search engine)
  # para obtener las keys y el cx.

  res = JSON.parse(Net::HTTP.get(URI.parse("https://www.googleapis.com/customsearch/v1?key=AIzaSyDzWrRdR3nM6lzxLICR5JHZIrfXPhXxkGw&cx=009685341942187120345:mdcz9w5bogw&imgSize=small&num=1&q=#{search}")))
  # p  "P normal" * 15
  # p res
  # p "PP" *15
  # pp res
  # p "IMAGE" *15

  # El método res regresa un JSON que contiene el url de la imgen que queremos obtener.
  # La siguiente ruta descompone el JSON para hacerlo.
  pp res["items"].first["pagemap"]["cse_image"].first["src"]
end

