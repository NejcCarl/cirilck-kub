#!/bin/bash

set -e

cat << 'EOF'
       _..._                                _..._
    .-'_..._''.                 .---.    .-'_..._''.
  .' .'      '.\.--.        .--.|   |  .' .'      '.\    .                        .                   /|
 / .'           |__|        |__||   | / .'             .'|                      .'|                   ||
. '             .--..-,.--. .--.|   |. '             .'  |                    .'  |                   ||
| |             |  ||  .-. ||  ||   || |            <    |      ,.----------.<    |                   ||  __
| |             |  || |  | ||  ||   || |             |   | ____//            \|   | ____      _    _  ||/'__ '.
. '             |  || |  | ||  ||   |. '             |   | \ .'\\            /|   | \ .'     | '  / | |:/`  '. '
 \ '.          .|  || |  '- |  ||   | \ '.          .|   |/  .  `'----------' |   |/  .     .' | .' | ||     | |
  '. `._____.-'/|__|| |     |__||   |  '. `._____.-'/|    /\  \               |    /\  \    /  | /  | ||\    / '
    `-.______ /     | |         '---'    `-.______ / |   |  \  \              |   |  \  \  |   `'.  | |/\'..' /
             `      |_|                           `  '    \  \  \             '    \  \  \ '   .'|  '/'  `'-'`
                                                    '------'  '---'          '------'  '---'`-'  `--'
EOF

echo "=> Cirilck-kub is for fresh Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

cat << 'EOF'

setup ssh keys for https://github.com/NejcCarl/cirilck-kub.git
EOF

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Cirilck-kub..."
rm -rf ~/.local/share/cirilck-kub
git clone https://github.com/NejcCarl/cirilck-kub.git  ~/.local/share/cirilck-kub >/dev/null

# if you want to check out from branch other than master
#The logic:
#  - If $OMAKUB_REF is unset or empty → treated as empty string, condition fails, uses master
#  - If $OMAKUB_REF is set to anything other than "master" → fetches and checks out that branch/tag
#  - ${OMAKUB_REF:-stable} means: use $OMAKUB_REF if set, otherwise default to "stable"
#if [[ $OMAKUB_REF != "master" ]]; then
#	cd ~/.local/share/cirilck-kub
#	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
#	cd -
#fi

echo "Installation starting..."
source ~/.local/share/cirilck-kub/install.sh
