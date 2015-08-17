require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'sportstats'
)

# does out model and sinatra work? lets see
  get '/' do

  stat = Stat.create({:league => 'nba', :team => 'bull'}).to_json
  @stat.new
  @stat.league = "nfl"
  @stat.team = "eagles"
  @stat.save
  @stat.to_json
end

## ok, we need an API bc the INTERNET need us

#GET: List
get '/api/stats' do
Stat.all.to_json
end

#GET: BY id
get '/api/stats/:id' do
  puts params
  Stat.find(params[:id]).to_json
  end

#POST: CREATE
post '/api/stats' do
  puts params
  Stat.create({
    :league => params[:league],
    :team => params[:team]
    }).to_json
end

#Patch: Update by ID
# you should never EVER update the ID of a madel (table row)
patch '/api/stats/:id' do
  cat_args = { :league => params[:league], :team => params[:team]}

  @stat = Stat.find(params[:id])
  @stat.update(stat_args)
  @stat.to_json

end

put '/api/stats/:id' do
  stat_args = { :league => params[:league], :team => params[:team]}
  #this is similar in rails
  #params.require(:cat).permit(:name, :bree)


  @stat = Stat.find(params[:id])
  @stat.update(stat_args)
  @stat.to_json

end

delete '/api/stats/:id' do
  # puts params
  Stat.destroy(params[:id]).to_json
end
