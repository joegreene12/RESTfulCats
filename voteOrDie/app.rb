require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'pdiddyvotes'
)

# does out model and sinatra work? lets see
  get '/' do

  vote = Vote.create({:name => 'steve_Colbert', :pparty => 'democrat'}).to_json
  # @vote.new
  # @vote.name = "Donald_Lame"
  # @vote.pparty = "green"
  # @vote.save
  # @vote.to_json
end

## ok, we need an API bc the INTERNET need us

#GET: List
get '/api/votes' do
Vote.all.to_json
end

#GET: BY id
get '/api/votes/:id' do
  puts params
  Vote.find(params[:id]).to_json
  end

#POST: CREATE
post '/api/votes' do
  puts params
  Vote.create({
    :name => params[:name],
    :pparty => params[:pparty]
    }).to_json
end

#Patch: Update by ID
# you should never EVER update the ID of a madel (table row)
patch '/api/votes/:id' do
  vote_args = { :name => params[:name], :pparty => params[:pparty]}

  @vote = Vote.find(params[:id])
  @vote.update(vote_args)
  @vote.to_json

end

put '/api/votes/:id' do
  vote_args = { :name => params[:name], :pparty => params[:pparty]}
  #this is similar in rails
  #params.require(:vote).permit(:name, :pparty)


  @vote = Vote.find(params[:id])
  @vote.update(vote_args)
  @vote.to_json

end

delete '/api/votes/:id' do
  # puts params
  Vote.destroy(params[:id]).to_json
end
