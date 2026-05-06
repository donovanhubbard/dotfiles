# csco updater

This purpose of this script is to display the Cisco stock price in your zsh terminal
prompt.

## Architecture

It's divided into two parts.

1. A background job that runs every ten minutes. This fetches the Cisco stock price and
stores the result in a flat text file located at `$HOME/.local/state/csco/price.txt`. It
also writes to a log file at `$HOME/.local/state/csco/logs/fetcher.log`
2. A zsh function that reads from the flat text file and updates the terminal prompt.
The zsh function is part of the precmd hook so it executes everytime the prompt is drawn
even though the text file is only updated every 10 minutes.

## Installation

### Background job

The background job is handled by launchd and managed by the launchctl cli.
The job definition is in a .plist file located at `~/Library/LaunchAgents/net.svenxix.csco.plist`.
I've symlinked it this directory.

Navigate to the above directory.


Install the agent
```
launchctl bootstrap gui/`id -u` ./net.svenxix.csco.plist
```

Search to see if the agent is installed
```
launchctl list | grep net.svenxix
```

Uninstall the agent
```
launchctl bootout gui/`id -u` ./net.svenxix.csco.plist
```

Manually kick off the job
```
launchctl kickstart gui/`id -u`/net.svenxix.csco
```

### prompt updating function

This is all handled by the zshrc file.

