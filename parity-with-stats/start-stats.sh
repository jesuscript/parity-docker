#!/bin/bash

hn=$(hostname)

cd $HOME
cat > stats.json << EOL
[
	{
		"name"							: "node-app",
		"script"						: "app.js",
		"log_date_format"		: "YYYY-MM-DD HH:mm Z",
    "cwd" : "netstats",
		"merge_logs"				: false,
		"watch"							: false,
		"max_restarts"			: 10,
		"exec_interpreter"	: "node",
		"exec_mode"					: "fork_mode",
		"env":
		{
			"NODE_ENV"				: "production",
			"RPC_HOST"				: "localhost",
			"RPC_PORT"				: "8545",
			"LISTENING_PORT"	: "30303",
			"INSTANCE_NAME"		: "fireworks-${hn}",
			"CONTACT_DETAILS" : "",
			"WS_SERVER"				: "wss://rpc.ethstats.net",
			"WS_SECRET"				: "a38e1e50b1b82fa",
			"VERBOSITY"				: 2
		
		}
	}
]
EOL


pm2 start stats.json
parity
