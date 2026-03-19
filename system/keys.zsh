# Pipe my public key to my clipboard.
# Prefers ed25519, falls back to RSA, errors if neither exists.
pubkey() {
  local key
  if [[ -f ~/.ssh/id_ed25519.pub ]]; then
    key=~/.ssh/id_ed25519.pub
  elif [[ -f ~/.ssh/id_rsa.pub ]]; then
    key=~/.ssh/id_rsa.pub
  else
    echo "No public key found (~/.ssh/id_ed25519.pub or ~/.ssh/id_rsa.pub)" >&2
    return 1
  fi
  pbcopy < "$key"
  echo "=> Public key copied to pasteboard ($key)."
}
