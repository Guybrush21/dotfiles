if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias s='kitten ssh' 
alias wb='cd /home/nic/code/welbee-monorepo '

alias ..='cd ..'
alias ...='cd ../..'

alias ga='git add'
alias gcm='git commit --all --message'
alias gcam='git commit --all --message'
alias gp='git push'
alias gl='git pull'
alias gsw='git switch'
alias gswc='git switch --create'
alias gst='git status'

alias pin='pnpm install'
alias pd='pnpm run dev'
alias pb='pnpm run build'
alias p='pnpm'

alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias ll='ls -l'      #long list


starship init fish | source
