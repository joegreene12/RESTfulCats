require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulcats'
)

# does out model and sinatra work? lets see
  get '/' do

  cat = Cat.create({:name => 'lame', :breed => 'simese'}).to_json
  # @cat.new
  # @cat.name = "lame"
  # @cat.breed = "simese"
  # @cat.save
  # @cat.to_json
end

## ok, we need an API bc the INTERNET need us

#GET: List
get '/api/cats' do
Cat.all.to_json
end

#GET: BY id
get '/api/cats/:id' do
  puts params
  Cat.find(params[:id]).to_json
  end

#POST: CREATE
post '/api/cats' do
  puts params
  Cat.create({
    :name => params[:name],
    :breed => params[:breed]
    }).to_json
end

#Patch: Update by ID
# you should never EVER update the ID of a madel (table row)
patch '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed]}

  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

put '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed]}
  #this is similar in rails
  #params.require(:cat).permit(:name, :bree)


  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json

end

delete '/api/cats/:id' do
  # puts params
  Cat.destroy(params[:id]).to_json
end
