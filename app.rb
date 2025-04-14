require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  
  @the_num = params.fetch("number").to_f
  
  @the_result = @the_num**2
  
  erb(:square_results)

end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @APR = params.fetch("APR").to_f
  @monthly_APR = (@APR/100/12)
  @years = params.fetch("years").to_f
  @months = @years * 12
  @prin = params.fetch("principal").to_f

  @pmt = (@monthly_APR*@prin) / (1-((1+@monthly_APR)**-@months))

  erb(:payment_results)
end
