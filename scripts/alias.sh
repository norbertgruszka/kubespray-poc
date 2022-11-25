alias dcu="docker-compose up | less -R"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias play="docker-compose run kubespray /bin/bash -c 'ansible-playbook cluster.yml -i inventory/hosts.yml --become'"
