# imported by hosts/<host>/users/<user>/settings/core.nix
{
  flake,
  inputs,
  ...
}: {
  imports = with flake.modules.home; [
    git
    # not really secret but rather a prototype for how utumno is used
    # provides: user.email, user.name
    inputs.utumno.modules.home.git
  ];

  home.stateVersion = "25.11";
}
