# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/zakv/.local/share/omf"

fundle plugin 'tuvistavie/fish-ssh-agent'

fundle init

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/zakv/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

alias f "cd ~/workspace/fig"

# Fix for emacs
function fish_title
  true
end

set -x VISUAL ec
set -x EDITOR ec
set -x RUST_SRC_PATH /Users/zakv/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
