--[[ 
    ComputerCraft/CC:Tweaked program.
    Falcon SE main program. This is the entry point for the Falcon SE environment.
--]]

local args = {...}
print("Welcome to the Falcon special environment.")


if arg[1] == "recover" then
    print("Falcon SE is starting in recovery mode...")
    print("Running shell ...")
    shell.execute("shell")
    print("Computer will reboot in 3 seconds.")
    sleep(3)
    os.reboot()
end
