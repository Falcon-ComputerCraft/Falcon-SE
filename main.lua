--[[ 
    ComputerCraft/CC:Tweaked program.
    Falcon SE main program. This is the entry point for the Falcon SE environment.
--]]

-- Shows an error and end sthe program.
local function showError(error_code, additional_info)
    print("An error has occured.")
    print("Error code: " .. error_code)
    print("Additional info: " .. additional_info)
    return
end

local function getDiskDrive()
    local disk_drive = peripheral.find("drive")

    -- Disk drive check
    while not disk_drive do
        print("Disk drive not found! Please attach a disk drive!")
        sleep(1)
        disk_drive = peripheral.find("drive")
    end
    print("Disk found! Continuing with installation.")

    -- Disk check
    while not disk_drive.isDiskPresent() do
        print("Disk not found!")
        sleep(1)
    end
    print("Disk found!")

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

if args[1] == "installToDrive" then
    local installUrl = args[2]
    local fileName
    local diskDrive = getDiskDrive()

    -- Check for HTTP
    if not http then
        showError("NO_HTTP", "Turn on HTTP for your world.")
    end

    -- Send a request
    local request = http.get(installUrl)
    local code = request.readAll()
    request.close()

    -- Write to the file.
    local file = fs.open(diskDrive.getMountPath() .. fileName, "w")
    
    -- Check if fs.open returns nil
    if not file then
        showError("FILE_ERROR", "File cannot be opened. Make sure the disk is not read only and there is space on disk.")
    end

    fs.write(code)
    fs.close()

    diskDrive.ejectDisk()
    print("Done installing! You may now use your program.")
end
