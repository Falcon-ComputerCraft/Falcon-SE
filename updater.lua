local mainurl = "https://raw.githubusercontent.com/Falcon-ComputerCraft/Falcon-SE/main/main.lua"

local request = http.get(mainurl)
if not request then
    print("Request failed!")
    return
end
local code = request.readAll()
request.close()

local file = fs.open("main.lua", "w")
file.write(code)
file.close()
print("Done updating!")
