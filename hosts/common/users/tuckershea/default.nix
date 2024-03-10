{ pkgs, lib, ... }:
let
  inherit (pkgs) stdenv;
in
{
  users.users.tuckershea = {
    home = if stdenv.isDarwin then "/Users/tuckershea" else "/home/tuckershea";
    shell = pkgs.zsh;

    # openssh.authorizedKeys

    packages = [
      
    ];
  } // lib.optionalAttrs stdenv.isLinux {
    group = "tuckershea";
    isNormalUser = true;
  };

  users.groups.tuckershea = { };
}

