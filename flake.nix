{
  description = "Home Manager configuration of scottgibb";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      mkHomeConfiguration =
        system: modules:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          inherit modules;
        };
    in
    {
      homeConfigurations = {

        # Work Mac (Apple Silicon)
        "scogib01@work-mac" = mkHomeConfiguration "aarch64-darwin" [
          ./home.nix
          ./modules/work.nix
          ./hosts/work-mac.nix
        ];

        # Work Linux (aarch64)
        "scott@work-linux" = mkHomeConfiguration "aarch64-linux" [
          ./home.nix
          ./modules/work.nix
          ./hosts/work-linux.nix
        ];

        # Personal Mac (Apple Silicon)
        "scottgibb@personal-mac" = mkHomeConfiguration "aarch64-darwin" [
          ./home.nix
          ./modules/personal.nix
          ./hosts/personal-mac.nix
        ];

        # NAS (likely x86_64 Linux)
        "pi@nas" = mkHomeConfiguration "x86_64-linux" [
          ./home.nix
          ./modules/personal.nix
          ./hosts/nas.nix
        ];

        # Raspberry Pi (ARM Linux)
        "pi@pi" = mkHomeConfiguration "aarch64-linux" [
          ./home.nix
          ./modules/personal.nix
          ./hosts/pi.nix
        ];
      };
    };
}
