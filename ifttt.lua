--ifttt.lua
conn = nil
conn=net.createConnection(net.TCP, 0) 

conn:on("receive", function(conn, payload) 
     print(payload) 
     end) 
     
conn:on("connection", function(conn, payload) 
     print('\nConnected') 
     --door_opened  change own event
     --cgEUrKuMnLOMhNWefBYB2RlRu415komCuxchVLVdqVO change own maker key
     conn:send("GET /trigger/door_opened/with/key/**********"
      .." HTTP/1.1\r\n" 
      .."Host: maker.ifttt.com\r\n"
      .."Accept: */*\r\n" 
      .."User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n" 
      .."\r\n")
     end) 
     
conn:on("disconnection", function(conn, payload) 
      print('\nDisconnected') 
      end)
      
print('Posting to ifttt.com')                                    
conn:connect(80,'maker.ifttt.com')
