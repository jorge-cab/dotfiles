HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

setopt prompt_subst

bindkey -v

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -M viins '^R' history-incremental-search-backward

git_prompt_info() {
  # Get current branch name; if not in a git repo, do nothing
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  # If there are any changes, mark repo as dirty with a star
  local dirty=""
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    dirty="%F{magenta}*%f"
  fi

  # Use prompt color codes; NO printf so %F is not eaten
  print -r -- "(%F{cyan}${branch}%f${dirty}) "
}

# Prompt
PROMPT='[%F{#F29668}%n%f%F{green}@%f%F{cyan}%m%f] %F{#D2A6FF}%~%f $(git_prompt_info)%F{yellow}->%f '

# eza aliases (modern ls replacement)
alias ls='eza --icons'
alias ll='eza -lah --icons --git'
alias la='eza -a --icons'
alias lt='eza --tree --icons'

# Screenshots
screenshot() {
    local filename="$HOME/Images/screenshots/screenshot-$(date '+%Y-%m-%d_%H-%M-%S').png"
    grim -g "$(slurp)" "$filename"
    echo "Saved: $filename"
}

eval "$(zoxide init zsh --cmd cd)"

# Add asdf shims to PATH (must come before other PATH additions)
export PATH="$HOME/.asdf/shims:$PATH"
eval "$(fnm env --use-on-cd --shell zsh)"
export PATH="$HOME/.local/bin:$PATH"

# Android SDK
export ANDROID_HOME="$HOME/Android/Sdk"
path=("$ANDROID_HOME/cmdline-tools/latest/bin" "$ANDROID_HOME/platform-tools" "$ANDROID_HOME/emulator" $path)
