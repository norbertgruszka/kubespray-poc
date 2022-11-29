alias dcu="docker-compose up | less -R"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias play="docker-compose run kubespray /bin/bash -c 'ansible-playbook cluster.yml -i inventory/hosts.yml --become' | tee play_log_$( date +"%Y_%m_%d_%H%M%S" ).txt"
alias upgrade="docker-compose run kubespray /bin/bash -c 'ansible-playbook upgrade-cluster.yml -i inventory/hosts.yml --become' | tee upgrade_log_$( date +"%Y_%m_%d_%H%M%S" ).txt"

