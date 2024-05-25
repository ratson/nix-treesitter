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
          inputVersion = input: "${builtins.substring 0 8 input.lastModifiedDate}.${input.shortRev}";
          grammars = lib.mapAttrs'
            (k: input: lib.nameValuePair k (pkgs:
              if lib.hasAttr k pkgs.tree-sitter-grammars then
                pkgs.tree-sitter-grammars.${k}.overrideAttrs
                  (_: {
                    src = input;
                    version = inputVersion input;
                  })
              else
                pkgs.tree-sitter.buildGrammar
                  {
                    language = k;
                    location = if lib.hasAttr k locations then locations.${k} else null;
                    src = input;
                    version = inputVersion input;
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
    tree-sitter-c-sharp = {
      url = "github:tree-sitter/tree-sitter-c-sharp";
      flake = false;
    };
    tree-sitter-diff = {
      url = "github:the-mikedavis/tree-sitter-diff";
      flake = false;
    };
    tree-sitter-dockerfile = {
      url = "github:camdencheek/tree-sitter-dockerfile";
      flake = false;
    };
    tree-sitter-dotbox = {
      url = "github:jakehamilton/tree-sitter-dotbox";
      flake = false;
    };
    tree-sitter-erlang = {
      url = "github:WhatsApp/tree-sitter-erlang";
      flake = false;
    };
    tree-sitter-esdl = {
      url = "github:matoous/tree-sitter-esdl";
      flake = false;
    };
    tree-sitter-fennel = {
      url = "github:alexmozaidze/tree-sitter-fennel";
      flake = false;
    };
    tree-sitter-git-config = {
      url = "github:the-mikedavis/tree-sitter-git-config";
      flake = false;
    };
    tree-sitter-git-rebase = {
      url = "github:the-mikedavis/tree-sitter-git-rebase";
      flake = false;
    };
    tree-sitter-gitattributes = {
      url = "github:ObserverOfTime/tree-sitter-gitattributes";
      flake = false;
    };
    tree-sitter-gitignore = {
      url = "github:shunsambongi/tree-sitter-gitignore";
      flake = false;
    };
    tree-sitter-gleam = {
      url = "github:gleam-lang/tree-sitter-gleam";
      flake = false;
    };
    tree-sitter-go = {
      url = "github:tree-sitter/tree-sitter-go";
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
    tree-sitter-haskell = {
      url = "github:tree-sitter/tree-sitter-haskell";
      flake = false;
    };
    tree-sitter-heex = {
      url = "github:connorlay/tree-sitter-heex";
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
    tree-sitter-julia = {
      url = "github:tree-sitter/tree-sitter-julia";
      flake = false;
    };
    tree-sitter-latex = {
      url = "github:latex-lsp/tree-sitter-latex";
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
    tree-sitter-numbat = {
      url = "github:irevoire/tree-sitter-numbat";
      flake = false;
    };
    tree-sitter-perl = {
      url = "github:tree-sitter-perl/tree-sitter-perl/release";
      flake = false;
    };
    tree-sitter-php = {
      url = "github:tree-sitter/tree-sitter-php";
      flake = false;
    };
    tree-sitter-proto = {
      url = "github:treywood/tree-sitter-proto";
      flake = false;
    };
    tree-sitter-puppet = {
      url = "github:amaanq/tree-sitter-puppet";
      flake = false;
    };
    tree-sitter-ql-dbscheme = {
      url = "github:tree-sitter/tree-sitter-ql-dbscheme";
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
    tree-sitter-ssh-config = {
      url = "github:ObserverOfTime/tree-sitter-ssh-config";
      flake = false;
    };
    tree-sitter-strace = {
      url = "github:sigmaSd/tree-sitter-strace";
      flake = false;
    };
    tree-sitter-svelte = {
      url = "github:tree-sitter-grammars/tree-sitter-svelte";
      flake = false;
    };
    tree-sitter-sxhkdrc = {
      url = "github:RaafatTurki/tree-sitter-sxhkdrc";
      flake = false;
    };
    tree-sitter-tmux = {
      url = "github:Freed-Wu/tree-sitter-tmux";
      flake = false;
    };
    tree-sitter-tsx = {
      url = "github:tree-sitter/tree-sitter-typescript";
      flake = false;
    };
    tree-sitter-vimdoc = {
      url = "github:neovim/tree-sitter-vimdoc";
      flake = false;
    };
    tree-sitter-vala = {
      url = "github:vala-lang/tree-sitter-vala";
      flake = false;
    };
    tree-sitter-vue = {
      url = "github:tree-sitter-grammars/tree-sitter-vue/main";
      flake = false;
    };
    tree-sitter-xml = {
      url = "github:tree-sitter-grammars/tree-sitter-xml";
      flake = false;
    };
    tree-sitter-yuck = {
      url = "github:Philipp-M/tree-sitter-yuck";
      flake = false;
    };
  };
}
