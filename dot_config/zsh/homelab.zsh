# Homelab / k3s shell environment.
# Managed by chezmoi: ~/.local/share/chezmoi/dot_config/zsh/homelab.zsh
# Sourced from .zshrc.

# Point sops at the age key so `sops file.enc.yaml` just works. This is an
# env var rather than an alias on purpose: an alias only applies to
# interactive shells, so it would silently not apply inside scripts or when
# another tool shells out to sops.
export SOPS_AGE_KEY_FILE=/var/lib/homelab-data/secrets/age.agekey

# Edit an encrypted secret: decrypts to $EDITOR, re-encrypts on save.
alias se='sops'
# Show a secret's plaintext without editing.
alias sd='sops --decrypt'
# Encrypt a plaintext file in place.
alias sen='sops --encrypt --in-place'

export HOMELAB=/var/lib/homelab
alias hl='cd $HOMELAB'

# Flux
alias fg='flux get kustomizations'
alias fr='flux reconcile kustomization'
alias frs='flux reconcile source git flux-system'
