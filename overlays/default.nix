# Example overlay for custom packages or package overrides
# This is a template - uncomment and modify as needed

# final: prev: {
#   # Example: Override an existing package
#   # ripgrep = prev.ripgrep.overrideAttrs (oldAttrs: {
#   #   # Your overrides here
#   # });

#   # Example: Add a custom package
#   # my-custom-tool = prev.callPackage ./pkgs/my-custom-tool { };
# }

# To use this overlay, add it to flake.nix:
# overlays = [ (import ./overlays/default.nix) ];
final: prev: { }
