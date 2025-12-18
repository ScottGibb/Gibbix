{
  description = "Home Manager configuration of scottgibb";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      mkHomeConfiguration = system: modules: 
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          inherit modules;
        };
    in {
      homeConfigurations = {
        # Personal Mac (Apple Silicon)
        "scottgibb@personal-mac" = mkHomeConfiguration "aarch64-darwin" [
          ./home.nix
          ./hosts/personal-mac.nix
        ];

        # Work Mac (Apple Silicon)
        "scottgibb@work-mac" = mkHomeConfiguration "aarch64-darwin" [
          ./home.nix
          ./hosts/work-mac.nix
        ];

        # NAS (likely x86_64 Linux)
        "scottgibb@nas" = mkHomeConfiguration "x86_64-linux" [
          ./home.nix
          ./hosts/nas.nix
        ];

        # Raspberry Pi (ARM Linux)
        "scottgibb@pi" = mkHomeConfiguration "aarch64-linux" [
          ./home.nix
          ./hosts/pi.nix
        ];
      };
    };
}
