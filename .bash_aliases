# General System Management
alias cls='clear'                               # Clear terminal screen
alias h='history'                               # Show command history
alias ..='cd ..'                                # Go up one directory
alias ...='cd ../..'                            # Go up two directories
alias ls='ls -p --color=auto'                   # Add trailing / to directories, with color
alias la='ls -A'                                # All except . and ..
alias ll='ls -l'                                # Long format
alias lla='ls -lA'                              # Long format, all files
alias reload='source ~/.bashrc'                 # Reload bash configuration
alias update='sudo apt update && sudo apt upgrade -y'  # Update all system packages
alias ports='sudo netstat -tulanp'              # List all listening ports with PID
alias dfh='df -h'                               # Show disk usage in human-readable format
alias duh='du -sh * | sort -h'                  # Show size of all folders/files in current dir

# Monitoring & Networking
alias topcpu='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head'  # Top CPU processes
alias topmem='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'  # Top memory processes
alias watchlog='watch tail -n 50 /var/log/syslog'                 # Continuously watch latest syslog
alias myip='curl ifconfig.me'                                     # Show public IP address

# Package Management
alias install='sudo apt install'               # Install packages
alias remove='sudo apt remove'                 # Remove packages
alias search='apt search'                      # Search for packages

# Docker
alias d='docker'                                # Shortcut for docker
alias dps='docker ps'                           # List running containers
alias dpa='docker ps -a'                        # List all containers
alias dimg='docker images'                      # List docker images
alias drm='docker rm $(docker ps -aq)'          # Remove all containers
alias drmi='docker rmi $(docker images -q)'     # Remove all images
alias dstop='docker stop $(docker ps -q)'       # Stop all running containers
alias dclean='docker system prune -a --volumes' # Clean up docker (containers, images, volumes)

# Docker Compose
alias dcu='docker compose up -d'                         # Start all services (detached)
alias dcd='docker compose down'                          # Stop and remove containers, network
alias dcb='docker compose build'                         # Build/rebuild services
alias dcre='docker compose up -d --build'                # Rebuild and start containers
alias dcl='docker compose logs -f'                       # Tail logs from all services
alias dclf='docker compose logs -f --tail=100'           # Tail last 100 log lines
alias dce='docker compose exec'                          # Execute a command in a running container
alias dcp='docker compose ps'                            # Show container status
alias dcr='docker compose restart'                       # Restart all containers
alias dcpull='docker compose pull'                       # Pull latest images
alias dcdnv='docker compose down -v'                     # Stop and remove volumes

alias myaliases='echo -e "\n🌟 My Aliases\n" && \
echo "General:" && grep -E "alias (cls|h|\.\.|\.\.\.|ls|la|ll|lla|reload|update|dfh|duh)=" ~/.bash_aliases && \
echo -e "\nMonitoring:" && grep -E "alias (topcpu|topmem|watchlog|myip)=" ~/.bash_aliases && \
echo -e "\nPackage:" && grep -E "alias (install|remove|search)=" ~/.bash_aliases && \
echo -e "\nDocker:" && grep -E "alias (d|dps|dpa|dimg|drm|drmi|dstop|dclean)=" ~/.bash_aliases && \
echo -e "\nDocker Compose:" && grep -E "alias (dcu|dcd|dcb|dcre|dcl|dclf|dce|dcp|dcr|dcpull|dcdnv)=" ~/.bash_aliases'

