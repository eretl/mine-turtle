print("Do prvniho slotu truhly dejte torche, do druheho cobble")
    sleep(3)
    local tunnelMax
    local tunnel
    repeat
      print("Zadejte delku tunelu max(256): ")
      tunnelMax = tonumber(read())
      tunnel = tunnelMax
      if tunnelMax <= 0 then
      print("Chyba! Tunnel nemuze mit 0 nebo zapornou hodnotu!")
      end
      if tunnelMax > 256 then
      print("Chyba! Tunnel nemuze byt dalsi nez 256 bloku!")
      end
    until tunnelMax > 0 and tunnelMax < 257
    local torch = 6
    local torchI = 1
    local cobbleI = 2
    
    term.clear()
    print("Panda tezicka 0.65")
    sleep(3)
    term.clear()
    print("Vybiram veci z truhly")
    turtle.select(1)
    turtle.suckDown(64, 1)
    turtle.select(2)
    turtle.suckDown(64, 2)  
    print("Zacinam tezit")
    
    turtle.dig()
    
    
    while tunnel > 0 do
      turtle.forward()
      
      while turtle.detect() do
        turtle.dig()
      end
      
      while turtle.detectUp() do
        turtle.digUp()
      end
      
      while turtle.detectDown() do
        turtle.digDown()
      end
      
      tunnel = tunnel - 1
      torch = torch - 1
      
      turtle.down()
      turtle.select(2)
      turtle.placeDown(cobbleI)
      turtle.up()
      
      if torch < 0 then
        turtle.select(1)
        turtle.placeDown(torchI)
        torch = 6  
      end
    end
    turtle.forward()
    while turtle.detectUp() do
        turtle.digUp()
    end
    while turtle.detectDown() do
        turtle.digDown()
    end
    turtle.back()  
    
    while tunnelMax > 0 do
      turtle.back()
      tunnelMax = tunnelMax - 1      
    end       
    if tunnelMax <= 0 then
        if turtle.detectDown()then
           for i=1,16,1 do
           turtle.select(i)
           turtle.dropDown()
           end
           print("Tezba dokoncena, veci v truhle")
           else
           print("Error truhla nenalezena")
        end
    end
