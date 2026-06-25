{
  nixConfig = {
    extra-substituters = [
      "https://nix-cache.fossi-foundation.org"
    ];
    extra-trusted-public-keys = [
      "nix-cache.fossi-foundation.org:3+K59iFwXqKsL7BNu6Guy0v+uTlwsxYQxjspXzqLYQs="
    ];
  };

  inputs = {
    librelane.url = "github:librelane/librelane/dev";
  };

  outputs =
    {
      self,
      librelane,
      ...
    }:
    let
      nix-eda = librelane.inputs.nix-eda;
      devshell = librelane.inputs.devshell;
      nixpkgs = nix-eda.inputs.nixpkgs;
      lib = nixpkgs.lib;
    in
    {
      # Outputs
      legacyPackages = nix-eda.forAllSystems (
        system:
        import nixpkgs {
          inherit system;
          overlays = [
            nix-eda.overlays.default
            devshell.overlays.default
            librelane.overlays.default
          ];
        }
      );

      packages = nix-eda.forAllSystems (system: {
        inherit (self.legacyPackages.${system}.python3.pkgs) ;
      });

      devShells = nix-eda.forAllSystems (
        system:
        let
          pkgs = (self.legacyPackages.${system});
          callPackage = lib.callPackageWith pkgs;
          
        cocotbext-uart = pkgs.python3Packages.buildPythonPackage rec {
          pname = "cocotbext-uart";
          version = "0.1.4";
          format = "pyproject";
          build-system = with pkgs.python3Packages; [
            setuptools
          ];
          dontCheckRuntimeDeps = true;
        
          src = pkgs.fetchFromGitHub {
            owner = "alexforencich";
            repo = "cocotbext-uart";
            rev = "3f8c2602367940110bdb8204d4d36d33a4e383a6";
            sha256 = "13dw8s6xgf92w79hx2i0c6yawyjx9flwgwgiswfcrvyraw3f5rd9";
          };
        };
        
        in
        {
          default = pkgs.librelane-shell.override ({
            extra-packages = with pkgs; [
              # Utilities
              gnumake
              gnugrep
              gawk

              # Simulation
              iverilog
              verilator

              # Waveform viewing
              gtkwave
              surfer
            ];

            extra-python-packages =
              ps: with ps; [
                # Verification
                cocotb
                cocotbext-uart
                pytest
                pytest-xdist

                # For KLayout Python DRC runner
                docopt

                # For logo generation
                pillow
              ];
          });
        }
      );
    };
}
