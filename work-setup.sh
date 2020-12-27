#!/bin/bash

echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/50_max_user_watches.conf && sudo sysctl --system
