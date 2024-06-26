{
  pkgs,
  lib,
  ...
}: let
  inherit (pkgs) stdenv;
in {
  users.users.tuckershea =
    {
      home =
        if stdenv.isDarwin
        then "/Users/tuckershea"
        else "/home/tuckershea";
      shell = pkgs.zsh;
      description = "Tucker Shea";

      openssh.authorizedKeys.keyFiles = [
        ../../../../resources/publickeys/id_tuckershea_elmira.pub
      ];

      packages = [];
    }
    // lib.optionalAttrs stdenv.isLinux {
      group = "tuckershea";
      isNormalUser = true;
      extraGroups = ["wheel"];
    };

  users.groups.tuckershea = {};
}
