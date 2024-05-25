{
  description = "Tree sitter grammars";

  outputs = { flakelight, ... }@inputs:
    flakelight ./. ({ lib, ... }: {
      inherit inputs;

      systems = lib.systems.flakeExposed;

      packages =
        let
          locations = {
            tree-sitter-dtd = "dtd";
            tree-sitter-xml = "xml";
          };
          grammars = lib.mapAttrs'
            (k: input: lib.nameValuePair k ({ tree-sitter, ... }: tree-sitter.buildGrammar {
              language = k;
              location = if lib.hasAttr k locations then locations.${k} else null;
              src = input;
              version = "${builtins.substring 0 8 input.lastModifiedDate}.${input.shortRev}";
            }))
            ((lib.filterAttrs (k: _: lib.hasPrefix "tree-sitter-" k) inputs) // {
              tree-sitter-dtd = inputs.tree-sitter-xml;
            });
        in
        grammars // {
          default = { tree-sitter, outputs', ... }: tree-sitter.withPlugins (_:
            tree-sitter.allGrammars ++
            lib.attrValues (lib.filterAttrs (k: _: lib.hasPrefix "tree-sitter-" k) outputs'.packages));
        };
    });

  inputs = {
    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    tree-sitter-astro = {
      url = "github:virchau13/tree-sitter-astro";
      flake = false;
    };
    tree-sitter-diff = {
      url = "github:the-mikedavis/tree-sitter-diff";
      flake = false;
    };
    tree-sitter-dotbox = {
      url = "github:jakehamilton/tree-sitter-dotbox";
      flake = false;
    };
    tree-sitter-esdl = {
      url = "github:matoous/tree-sitter-esdl";
      flake = false;
    };
    tree-sitter-git-config = {
      url = "github:the-mikedavis/tree-sitter-git-config";
      flake = false;
    };
    tree-sitter-gosum = {
      url = "github:amaanq/tree-sitter-go-sum";
      flake = false;
    };
    tree-sitter-gotmpl = {
      url = "github:ngalaiko/tree-sitter-go-template";
      flake = false;
    };
    tree-sitter-gritql = {
      url = "github:getgrit/tree-sitter-gritql";
      flake = false;
    };
    tree-sitter-hyprlang = {
      url = "github:luckasRanarison/tree-sitter-hyprlang";
      flake = false;
    };
    tree-sitter-ini = {
      url = "github:justinmk/tree-sitter-ini";
      flake = false;
    };
    tree-sitter-jsonc = {
      url = "gitlab:WhyNotHugo/tree-sitter-jsonc";
      flake = false;
    };
    tree-sitter-juice = {
      url = "github:juicelang/tree-sitter-juice";
      flake = false;
    };
    tree-sitter-luadoc = {
      url = "github:tree-sitter-grammars/tree-sitter-luadoc";
      flake = false;
    };
    tree-sitter-luap = {
      url = "github:amaanq/tree-sitter-luap";
      flake = false;
    };
    tree-sitter-ninja = {
      url = "github:alemuller/tree-sitter-ninja";
      flake = false;
    };
    tree-sitter-puppet = {
      url = "github:amaanq/tree-sitter-puppet";
      flake = false;
    };
    tree-sitter-rasi = {
      url = "github:Fymyte/tree-sitter-rasi";
      flake = false;
    };
    tree-sitter-ron = {
      url = "github:amaanq/tree-sitter-ron";
      flake = false;
    };
    tree-sitter-tmux = {
      url = "github:Freed-Wu/tree-sitter-tmux";
      flake = false;
    };
    tree-sitter-vimdoc = {
      url = "github:neovim/tree-sitter-vimdoc";
      flake = false;
    };
    tree-sitter-xml = {
      url = "github:tree-sitter-grammars/tree-sitter-xml";
      flake = false;
    };
  };
}
