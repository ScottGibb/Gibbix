{
  description = "Home Manager configuration of scottgibb";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let
      # Helper function to create home configurations
      mkHomeConfiguration =
        system: modules:
        home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          extraSpecialArgs = {
            pkgsUnstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
          inherit modules;
        };

      # List of all supported systems
      allSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];

      # Helper to run a function for each system
      forAllSystems = nixpkgs.lib.genAttrs allSystems;
    in
    {
      # Formatter for `nix fmt`
      formatter = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.nixfmt-rfc-style
      );

      # Development shells for working on this configuration
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            name = "gibbix-dev";
            buildInputs = with pkgs; [
              nixfmt-rfc-style
              nil # Nix language server
              nixd # Another Nix language server option
              statix # Nix linter
              deadnix # Find dead Nix code
            ];
            shellHook = ''
              echo "🚀 Gibbix development environment loaded!"
              echo ""
              echo "Available tools:"
              echo "  - nixfmt-rfc-style: Format Nix files"
              echo "  - nil/nixd: Nix language servers"
              echo "  - statix: Nix linter"
              echo "  - deadnix: Find unused Nix code"
              echo ""
              echo "Quick commands:"
              echo "  - nix fmt: Format all Nix files"
              echo "  - nix flake check: Validate configuration"
              echo "  - home-manager switch: Apply changes"
            '';
          };
        }
      );

      homeConfigurations = {

        # Work Mac (Apple Silicon)
        "scogib01@work-mac" = mkHomeConfiguration "aarch64-darwin" [
          ./home.nix
          ./modules/gui-tools.nix
          ./modules/work.nix
          ./hosts/work-mac.nix
        ];

        # Work Linux (explicit architectures)
        "scogib01@work-linux-x86_64" = mkHomeConfiguration "x86_64-linux" [
          ./home.nix
          ./modules/work.nix
          ./hosts/work-linux.nix
        ];

        "scogib01@work-linux-aarch64" = mkHomeConfiguration "aarch64-linux" [
          ./home.nix
          ./modules/work.nix
          ./hosts/work-linux.nix
        ];

        # Personal Mac (Apple Silicon)
        "scottgibb@personal-mac" = mkHomeConfiguration "aarch64-darwin" [
          ./home.nix
          ./modules/gui-tools.nix
          ./modules/personal.nix
          ./hosts/personal-mac.nix
        ];

        # NAS (likely x86_64 Linux)
        "pi@nas" = mkHomeConfiguration "x86_64-linux" [
          ./home.nix
          # ./modules/personal.nix
          ./hosts/nas.nix
        ];

        # Raspberry Pi (ARM Linux)
        "pi@pi" = mkHomeConfiguration "aarch64-linux" [
          ./home.nix
          # ./modules/personal.nix
          ./hosts/pi.nix
        ];
      };
    };

}
