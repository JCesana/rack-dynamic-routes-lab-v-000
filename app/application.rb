class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request(env)
    
    if req.path=="/items/#{Item}"
      resp.write "#{Item.price}"
    else
      resp.write "Route not found"
      resp.status = 400
    end
    
    resp.finish
  end 
end 