{ modulesPath, lib, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix

    ../common/core
    
    ../common/optional/tailscale-nixos.nix
    ./secrets.nix

    ../common/users/tuckershea
  ];

  networking.networkmanager.enable = true;
  networking.hostName = "marlon";

  system.stateVersion = "23.11";

  users.users.root.openssh.authorizedKeys.keys = [
    # elmira/tuckershea
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFyE8YLri8Z06sDpouGHhi5jcNpNdESgqBbUMRoER9GK"
  ];
}