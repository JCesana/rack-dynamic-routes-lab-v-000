class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request(env)
    
    if req.path=="/items/#{item}"
      resp.write 
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
  end 
end 