import subprocess
import os


def dockerVersion():
    command = subprocess.run(
        'docker version --format "{{.Server.Version}}"',
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    if command.returncode != 0:
        error = command.stderr.decode("UTF-8")
        return error
    else:
        return command.stdout.decode("UTF-8").strip()


def detectSecondMonitor():
    commandXrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"
    command = subprocess.run(
        commandXrandr, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    if command.returncode != 0:
        error = command.stderr.decode("UTF-8")
        print(error)
        return 1
    else:
        return int(command.stdout.decode("UTF-8"))


def getCurrentWifi():
    wifiCommand = "nmcli dev status | awk '{print $4}' | awk 'FNR==2'"
    command = subprocess.run(
        wifiCommand, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    if command.returncode != 0:
        error = command.stderr.decode("UTF-8")
        return error
    else:
        return command.stdout.decode("UTF-8").strip()


def nameMachine():
    return os.uname()[1].lower()


def isL15():
    return nameMachine().find("l15") != -1
