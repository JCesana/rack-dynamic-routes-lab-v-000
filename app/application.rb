class Application
  @@items = [] 
  
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      
      if item.nil?
        resp.write "Item not found"
        resp.status = 400  
      else 
        resp
      end 
      resp.write "#{Item.price}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    if req.path.match(/songs/)
 
      item_name = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    end
    
    resp.finish
  end 
end 