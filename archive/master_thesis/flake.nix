# Complete list of available TeX packages: https://raw.githubusercontent.com/NixOS/nixpkgs/nixos-22.05/pkgs/tools/typesetting/tex/texlive/pkgs.nix
#
# Information on the latexmkrc file:
# - https://www.overleaf.com/learn/latex/Articles/An_introduction_to_Kpathsea_and_how_TeX_engines_search_for_files
# - https://www.overleaf.com/learn/latex/Questions/I_have_a_lot_of_.cls%2C_.sty%2C_.bst_files%2C_and_I_want_to_put_them_in_a_folder_to_keep_my_project_uncluttered._But_my    _project_is_not_finding_them_to_compile_correctly.
{
  description = "Master Thesis";
  inputs = {
    devshell.url = "github:numtide/devshell";
    flake-utils.url = github:numtide/flake-utils;
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.11;
  };
  outputs = { self, devshell, flake-utils, nixpkgs }:
    with flake-utils.lib; eachSystem allSystems (system:
    let

      documentName = "master_thesis";

      env = [
        {
          name = "OSFONTDIR";
          value = builtins.concatStringsSep ":" (map (fontPackage: "${fontPackage}/share/fonts//") fonts);
        }
        { # To make reproducible document, we set the date to the latest commit.
          name = "SOURCE_DATE_EPOCH";
          value = toString self.lastModified;
        }
        { # Required by LuaLaTeX.
          name = "TEXMFHOME";
          value = ".cache";
        }
        { # Required by LuaLateX.
          name = "TEXMFVAR";
          value = ".cache/texmf-var";
        }
      ];
      envAsBashExports = builtins.concatStringsSep " " (pkgs.lib.attrsets.mapAttrsToList (name: value: "${name}=\"${value}\"") (builtins.listToAttrs env));

      # PDFTex Fonts: Look for "collection-font" at https://raw.githubusercontent.com/NixOS/nixpkgs/nixos-21.11/pkgs/tools/typesetting/tex/texlive/pkgs.nix
      # Font names: https://www.overleaf.com/learn/latex/Font_typefaces
      # Useful commands:
      #
      # - Get list of available fonts: `fc-list | grep <name_of_font>`.
      # - Get font name: `fc-scan <path_to_folder_containing_font> | grep family`. You can find the path to the font folder with `fc-list` or by building the font package `$(nix eval "nixpkgs#<font_name>.outPath" --raw)`.
      # - Print font OTF properties: `otfinfo <path_to_font_file>`.
      fonts = [
        pkgs.source-serif
        pkgs.source-sans
        pkgs.source-code-pro
        # pkgs.stdenvNoCC.mkDerivation {
        #   pname = "charlevoix-pro";
        #   version = "1.0.0";
        #   src = ./fonts/charlevoix-pro;
        #   phases = [ "unpackPhase" "installPhase" ];
        #   installPhase = ''
        #     mkdir -p $out/share/fonts/opentype
        #     cp -r . $out/share/fonts/opentype
        #   '';
        # }
      ];

      packagesForLatex = [
        pkgs.coreutils
        pkgs.gnused # Required by PDFLaTeX at least
        pkgs.imagemagick # Required by the svg LaTeX package to produce PNG images.
        pkgs.inkscape # Required to include svg in LaTeX documents using the svg package.
        (pkgs.python39.withPackages (ps: with ps; [
          pygments
        ]))
        tex
        pkgs.which # Required by the minted LaTeX package.
      ] ++ fonts;

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ devshell.overlay ];
      };

      # Complete list of available teX packages: https://raw.githubusercontent.com/NixOS/nixpkgs/nixos-22.05/pkgs/tools/typesetting/tex/texlive/pkgs.nix
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
        scheme-medium # I use a lot of package, so using scheme-medium seems like a reasonable compromise between not having to define too many packages by hand and not importing too many useless packages.
        biber # Also part of collection-bibtexextra
        biblatex # Also part of collection-bibtexextra
				catchfile
				changepage
        cleveref
        csquotes
				enumitem
				floatrow
				framed
				fvextra
        graphicxpsd
				ifmtarg
				ifoddpage
        marginfix
        marginnote
        mdframed
        minted
        multicolrule
        needspace
        pgf
        pgfplots
        placeins
        platex-tools
        svg
        thmtools
        tikzpagenodes
        titlesec
        translations
        transparent
        trimspaces
        upquote
        xifthen
        xstring
        zref
        ;
      };
    in rec {
      devShell = # Used by `nix develop`, value needs to be a derivation
        pkgs.devshell.mkShell {
          name = documentName;

          inherit env;

          commands = let
            latexOptions =
              # PdfLaTeX
              # ''
              #   -pdf -pdflatex \
              #     -pretex="\pdftrailerid{}" \
              #     -usepretex ${documentName}.tex
              # '';
              # LuaLateX
              ''
                -pdf -lualatex \
                -pretex="\pdfvariable suppressoptionalinfo 512\relax" \
                -usepretex \
                -shell-escape \
                -interaction=nonstopmode \
                ${documentName}.tex
              '';
          in [
            {
              name = "build";
              help = "Builds the document.";
              category = "LaTeX";
              command = let
                build = pkgs.writeScript "build" ''
                  mkdir -p .cache/texmf-var
                  rm -f ${documentName}.pdf
                  latexmk ${latexOptions}
                '';
              in "${build}";
            }
            {
              name = "b";
              help = "An alias for `build`.";
              category = "LaTeX";
              command = "build";
            }
            {
              name = "clean";
              help = "Does some cleanup in the folder.";
              category = "LaTeX";
              command = let
	              clean = pkgs.writeScript "clean" ''
	                latexmk -c
                '';
              in "${clean}";
            }
            {
              name = "dev";
              help = "Builds the LaTeX document as soon as some file changes.";
              category = "LaTeX";
              command = let
              dev = pkgs.writeScript "dev" ''
                latexmk -pvc ${latexOptions}
              '';
              in "${dev}";
            }
          ];

          devshell.startup.prepareFolders.text = ''
            mkdir -p .cache/texmf-var
          '';

          packages = packagesForLatex;
        };

      packages = {
        document = pkgs.stdenvNoCC.mkDerivation rec {
          name = "document";
          src = ./.;
          buildInputs = packagesForLatex;
          phases = ["unpackPhase" "buildPhase" "installPhase"];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            ${commands.prepare}
            env ${envAsBashExports} \
              ${commands.build}
          '';
          installPhase = ''
            mkdir -p $out
            cp ${documentName}.pdf $out/
          '';
        };
      };
      defaultPackage = packages.document;
    });
}
