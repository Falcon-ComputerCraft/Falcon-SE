--[[ 
    ComputerCraft/CC:Tweaked program.
    Falcon SE main program. This is the entry point for the Falcon SE environment.
--]]

local function showError()
    
end

local function enforeInstallRequirements()
    local disk_drive = peripheral.find("drive")
    
    return disk_drive
end

local args = {...}
print("Welcome to the Falcon special environment.")

if args[1] == "recover" then
    print("Falcon SE is starting in recovery mode...")
    print("Running shell ...")
    shell.execute("shell")
    print("Computer will reboot in 3 seconds.")
    sleep(3)
    os.reboot()
end

if args[1] == "install" then
    local installurl = args[2]

    
end
