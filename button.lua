--button.lua
buttonPin = 2 
gpio.mode(buttonPin,gpio.INT,gpio.FLOAT)

function debounce (func)
    local last = 0
    local delay = 200000

    return function (...)
        local now = tmr.now()
        if now - last < delay then return end

        last = now
        return func(...)
    end
end

function onChange()
    if gpio.read(buttonPin) == 0 then
        print("That was easy! ")
        dofile("ifttt.lua") 
        tmr.delay(500000)
    end
end

gpio.trig(buttonPin,"down", debounce(onChange))
