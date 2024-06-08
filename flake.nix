{
  description = "Tree sitter grammars";

  outputs = { flakelight, ... }@inputs:
    flakelight ./. ({ lib, ... }: {
      inherit inputs;

      systems = lib.systems.flakeExposed;

      packages =
        let
          inherit (lib) filterAttrs hasAttr hasPrefix listToAttrs nameValuePair removePrefix;
          aliasInputs = {
            tree-sitter-dtd = inputs.tree-sitter-xml;
            tree-sitter-loongdoc-inline = inputs.tree-sitter-loongdoc;
            tree-sitter-markdown-inline = inputs.tree-sitter-markdown;
            tree-sitter-ocaml-interface = inputs.tree-sitter-ocaml;
            tree-sitter-ocaml-type = inputs.tree-sitter-ocaml;
            tree-sitter-php-only = inputs.tree-sitter-php;
            tree-sitter-psv = inputs.tree-sitter-csv;
            tree-sitter-rust-with-rstml = inputs.tree-sitter-rstml;
            tree-sitter-soql = inputs.tree-sitter-apex;
            tree-sitter-sosl = inputs.tree-sitter-apex;
            tree-sitter-terraform = inputs.tree-sitter-hcl;
            tree-sitter-tsv = inputs.tree-sitter-csv;
            tree-sitter-tsx = inputs.tree-sitter-typescript;
            tree-sitter-wast = inputs.tree-sitter-wat;
          };
          locations = {
            apex = "apex";
            ccomment = "tree-sitter-ccomment";
            csv = "csv";
            carbon = "utils/treesitter";
            dtd = "dtd";
            loongdoc = "tree-sitter-loongdoc";
            loongdoc-inline = "tree-sitter-loongdoc_inline";
            lura = "tree-sitter-lura";
            mozcpp = "tree-sitter-mozcpp";
            mozjs = "tree-sitter-mozjs";
            ocaml-type = "grammars/type";
            php-only = "php_only";
            preproc = "tree-sitter-preproc";
            psv = "psv";
            rstml = "rstml";
            rust-with-rstml = "rust_with_rstml";
            soql = "soql";
            sosl = "sosl";
            syncat-stylesheet = "tree-sitter-syncat-stylesheet";
            terraform = "dialects/terraform";
            tsv = "tsv";
            v = "tree_sitter_v";
            wast = "wast";
            wat = "wat";
            xml = "xml";
          };
          needGenerate = [
            "carbon"
            "rescript"
            "rtf"
            "swift"
            "systemrdl"
          ];
          findLocation = k: if hasAttr k locations then locations.${k} else null;
          inputVersion = input: "0.0.0+date=${builtins.substring 0 8 input.lastModifiedDate}_${input.shortRev}";
          removeTsPrefix = s: removePrefix "tree-sitter-" s;
          grammars = lib.mapAttrs'
            (k: input: nameValuePair k (pkgs:
              if hasAttr k pkgs.tree-sitter-grammars then
                pkgs.tree-sitter-grammars.${k}.overrideAttrs
                  (_: {
                    src = input;
                    version = inputVersion input;
                  })
              else
                pkgs.tree-sitter.buildGrammar
                  {
                    language = k;
                    location = findLocation (removeTsPrefix k);
                    generate = lib.elem (removeTsPrefix k) needGenerate;
                    src = input;
                    version = inputVersion input;
                  }))
            ((filterAttrs (k: _: hasPrefix "tree-sitter-" k) inputs) // aliasInputs);
        in
        grammars // {
          default = { tree-sitter, vimPlugins, outputs', ... }:
            let
              hasRev = p: rev:
                let
                  k = p.src.rev;
                  canReuse = x: hasPrefix (removeTsPrefix p.pname)
                    (removeTsPrefix (builtins.replaceStrings [ "_" ] [ "-" ] x.name));
                in
                hasAttr k rev && canReuse rev.${k};
              revTs = listToAttrs (map (x: nameValuePair x.src.rev x) tree-sitter.allGrammars);
              revVim = listToAttrs (map (x: nameValuePair x.src.rev x) vimPlugins.nvim-treesitter.passthru.allGrammars);
              selfGrammars = lib.attrValues (filterAttrs (k: v: hasPrefix "tree-sitter-" k) outputs'.packages);
              finalGrammars = map
                (x:
                  if hasRev x revTs then revTs.${x.src.rev}
                  else if hasRev x revVim then revVim.${x.src.rev}
                  else x)
                selfGrammars;
            in
            tree-sitter.withPlugins (_:
              vimPlugins.nvim-treesitter.passthru.allGrammars ++
              tree-sitter.allGrammars ++
              finalGrammars);
        };
    });

  inputs = {
    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    tree-sitter-actionscript = {
      url = "github:Rileran/tree-sitter-actionscript";
      flake = false;
    };
    tree-sitter-ada = {
      url = "github:briot/tree-sitter-ada";
      flake = false;
    };
    tree-sitter-adl = {
      url = "github:adl-lang/tree-sitter-adl";
      flake = false;
    };
    tree-sitter-agda = {
      url = "github:tree-sitter/tree-sitter-agda";
      flake = false;
    };
    tree-sitter-aidl = {
      url = "github:AndroidIDEOfficial/tree-sitter-aidl";
      flake = false;
    };
    tree-sitter-angular = {
      url = "github:dlvandenberg/tree-sitter-angular";
      flake = false;
    };
    tree-sitter-apachesynapse = {
      url = "github:DaAlbrecht/tree-sitter-apachesynapse";
      flake = false;
    };
    tree-sitter-apex = {
      url = "github:aheber/tree-sitter-sfapex";
      flake = false;
    };
    tree-sitter-applesoft = {
      url = "github:dfgordon/tree-sitter-applesoft";
      flake = false;
    };
    tree-sitter-arduino = {
      url = "github:tree-sitter-grammars/tree-sitter-arduino";
      flake = false;
    };
    tree-sitter-asm = {
      url = "github:RubixDev/tree-sitter-asm";
      flake = false;
    };
    tree-sitter-astro = {
      url = "github:virchau13/tree-sitter-astro";
      flake = false;
    };
    tree-sitter-august = {
      url = "github:ScratchCat458/tree-sitter-august";
      flake = false;
    };
    tree-sitter-authzed = {
      url = "github:mleonidas/tree-sitter-authzed";
      flake = false;
    };
    tree-sitter-awk = {
      url = "github:Beaglefoot/tree-sitter-awk";
      flake = false;
    };
    tree-sitter-bash = {
      url = "github:tree-sitter/tree-sitter-bash";
      flake = false;
    };
    tree-sitter-bass = {
      url = "github:vito/tree-sitter-bass";
      flake = false;
    };
    tree-sitter-beancount = {
      url = "github:polarmutex/tree-sitter-beancount";
      flake = false;
    };
    tree-sitter-bibtex = {
      url = "github:latex-lsp/tree-sitter-bibtex";
      flake = false;
    };
    tree-sitter-bicep = {
      url = "github:tree-sitter-grammars/tree-sitter-bicep";
      flake = false;
    };
    tree-sitter-bitbake = {
      url = "github:tree-sitter-grammars/tree-sitter-bitbake";
      flake = false;
    };
    tree-sitter-blade = {
      url = "github:EmranMR/tree-sitter-blade";
      flake = false;
    };
    tree-sitter-blueprint = {
      url = "gitlab:gabmus/tree-sitter-blueprint";
      flake = false;
    };
    tree-sitter-bp = {
      url = "github:ambroisie/tree-sitter-bp";
      flake = false;
    };
    tree-sitter-breaker = {
      url = "github:mielpeeters/tree-sitter-breaker";
      flake = false;
    };
    tree-sitter-brightscript = {
      url = "github:ajdelcimmuto/tree-sitter-brightscript";
      flake = false;
    };
    tree-sitter-c = {
      url = "github:tree-sitter/tree-sitter-c";
      flake = false;
    };
    tree-sitter-c-sharp = {
      url = "github:tree-sitter/tree-sitter-c-sharp";
      flake = false;
    };
    tree-sitter-cabal = {
      url = "github:thomasvergne/tree-sitter-cabal";
      flake = false;
    };
    tree-sitter-cairo = {
      url = "github:tree-sitter-grammars/tree-sitter-cairo";
      flake = false;
    };
    tree-sitter-capnp = {
      url = "github:tree-sitter-grammars/tree-sitter-capnp";
      flake = false;
    };
    tree-sitter-carbon = {
      url = "github:carbon-language/carbon-lang";
      flake = false;
    };
    tree-sitter-ccomment = {
      url = "github:mozilla/rust-code-analysis";
      flake = false;
    };
    tree-sitter-cel = {
      url = "github:bufbuild/tree-sitter-cel";
      flake = false;
    };
    tree-sitter-chatito = {
      url = "github:tree-sitter-grammars/tree-sitter-chatito";
      flake = false;
    };
    tree-sitter-cicada = {
      url = "github:Cicada-Software/tree-sitter-cicada";
      flake = false;
    };
    tree-sitter-clingo = {
      url = "github:potassco/tree-sitter-clingo";
      flake = false;
    };
    tree-sitter-clojure = {
      url = "github:sogaiu/tree-sitter-clojure";
      flake = false;
    };
    tree-sitter-cmake = {
      url = "github:uyha/tree-sitter-cmake";
      flake = false;
    };
    tree-sitter-coalton = {
      url = "github:coalton-lang/tree-sitter-coalton";
      flake = false;
    };
    tree-sitter-cobol = {
      url = "github:yutaro-sakamoto/tree-sitter-cobol";
      flake = false;
    };
    tree-sitter-comment = {
      url = "github:stsewd/tree-sitter-comment";
      flake = false;
    };
    tree-sitter-commonlisp = {
      url = "github:tree-sitter-grammars/tree-sitter-commonlisp";
      flake = false;
    };
    tree-sitter-cooklang = {
      url = "github:addcninblue/tree-sitter-cooklang";
      flake = false;
    };
    tree-sitter-corn = {
      url = "github:corn-config/tree-sitter-corn";
      flake = false;
    };
    tree-sitter-cpon = {
      url = "github:tree-sitter-grammars/tree-sitter-cpon";
      flake = false;
    };
    tree-sitter-cpp = {
      url = "github:tree-sitter/tree-sitter-cpp";
      flake = false;
    };
    tree-sitter-cql = {
      url = "github:shotover/tree-sitter-cql";
      flake = false;
    };
    tree-sitter-crystal = {
      url = "github:crystal-lang-tools/tree-sitter";
      flake = false;
    };
    tree-sitter-css = {
      url = "github:tree-sitter/tree-sitter-css";
      flake = false;
    };
    tree-sitter-css-in-js = {
      url = "github:orzechowskid/tree-sitter-css-in-js";
      flake = false;
    };
    tree-sitter-csv = {
      url = "github:tree-sitter-grammars/tree-sitter-csv";
      flake = false;
    };
    tree-sitter-cuda = {
      url = "github:tree-sitter-grammars/tree-sitter-cuda";
      flake = false;
    };
    tree-sitter-cue = {
      url = "github:eonpatapon/tree-sitter-cue";
      flake = false;
    };
    tree-sitter-d = {
      url = "github:gdamore/tree-sitter-d";
      flake = false;
    };
    tree-sitter-d2 = {
      url = "git+https://codeberg.org/p8i/tree-sitter-d2";
      flake = false;
    };
    tree-sitter-dart = {
      url = "github:UserNobody14/tree-sitter-dart";
      flake = false;
    };
    tree-sitter-dbml = {
      url = "github:dynamotn/tree-sitter-dbml";
      flake = false;
    };
    tree-sitter-devicetree = {
      url = "github:joelspadin/tree-sitter-devicetree";
      flake = false;
    };
    tree-sitter-dhall = {
      url = "github:jbellerb/tree-sitter-dhall";
      flake = false;
    };
    tree-sitter-diff = {
      url = "github:the-mikedavis/tree-sitter-diff";
      flake = false;
    };
    tree-sitter-disassembly = {
      url = "github:ColinKennedy/tree-sitter-disassembly";
      flake = false;
    };
    tree-sitter-djot = {
      url = "github:treeman/tree-sitter-djot";
      flake = false;
    };
    tree-sitter-dockerfile = {
      url = "github:camdencheek/tree-sitter-dockerfile";
      flake = false;
    };
    tree-sitter-dot = {
      url = "github:rydesun/tree-sitter-dot";
      flake = false;
    };
    tree-sitter-dotbox = {
      url = "github:jakehamilton/tree-sitter-dotbox";
      flake = false;
    };
    tree-sitter-doxygen = {
      url = "github:tree-sitter-grammars/tree-sitter-doxygen";
      flake = false;
    };
    tree-sitter-earthfile = {
      url = "github:glehmann/tree-sitter-earthfile";
      flake = false;
    };
    tree-sitter-ebnf = {
      url = "github:RubixDev/ebnf";
      flake = false;
    };
    tree-sitter-edoc = {
      url = "github:the-mikedavis/tree-sitter-edoc";
      flake = false;
    };
    tree-sitter-eds = {
      url = "github:uyha/tree-sitter-eds";
      flake = false;
    };
    tree-sitter-eex = {
      url = "github:connorlay/tree-sitter-eex";
      flake = false;
    };
    tree-sitter-eiffel = {
      url = "github:imustafin/tree-sitter-eiffel";
      flake = false;
    };
    tree-sitter-elisp = {
      url = "github:Wilfred/tree-sitter-elisp";
      flake = false;
    };
    tree-sitter-elixir = {
      url = "github:elixir-lang/tree-sitter-elixir";
      flake = false;
    };
    tree-sitter-elm = {
      url = "github:elm-tooling/tree-sitter-elm";
      flake = false;
    };
    tree-sitter-elsa = {
      url = "github:glapa-grossklag/tree-sitter-elsa";
      flake = false;
    };
    tree-sitter-elvish = {
      url = "github:elves/tree-sitter-elvish";
      flake = false;
    };
    tree-sitter-embedded-template = {
      url = "github:tree-sitter/tree-sitter-embedded-template";
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
    tree-sitter-exograph = {
      url = "github:exograph/tree-sitter-exograph";
      flake = false;
    };
    tree-sitter-facility = {
      url = "github:FacilityApi/tree-sitter-facility";
      flake = false;
    };
    tree-sitter-faust = {
      url = "github:khiner/tree-sitter-faust";
      flake = false;
    };
    tree-sitter-fennel = {
      url = "github:alexmozaidze/tree-sitter-fennel";
      flake = false;
    };
    tree-sitter-fidl = {
      url = "github:google/tree-sitter-fidl";
      flake = false;
    };
    tree-sitter-firrtl = {
      url = "github:tree-sitter-grammars/tree-sitter-firrtl";
      flake = false;
    };
    tree-sitter-fish = {
      url = "github:ram02z/tree-sitter-fish";
      flake = false;
    };
    tree-sitter-fluentbit = {
      url = "github:sh-cho/tree-sitter-fluentbit";
      flake = false;
    };
    tree-sitter-foam = {
      url = "github:FoamScience/tree-sitter-foam";
      flake = false;
    };
    tree-sitter-forester = {
      url = "github:kentookura/tree-sitter-forester";
      flake = false;
    };
    tree-sitter-formula = {
      url = "github:siraben/tree-sitter-formula";
      flake = false;
    };
    tree-sitter-forth = {
      url = "github:AlexanderBrevig/tree-sitter-forth";
      flake = false;
    };
    tree-sitter-fortran = {
      url = "github:stadelmanma/tree-sitter-fortran";
      flake = false;
    };
    tree-sitter-fsh = {
      url = "github:mgramigna/tree-sitter-fsh";
      flake = false;
    };
    tree-sitter-fsharp = {
      url = "github:ionide/tree-sitter-fsharp";
      flake = false;
    };
    tree-sitter-func = {
      url = "github:tree-sitter-grammars/tree-sitter-func";
      flake = false;
    };
    tree-sitter-fusion = {
      url = "gitlab:jirgn/tree-sitter-fusion";
      flake = false;
    };
    tree-sitter-gap = {
      url = "github:gap-system/tree-sitter-gap";
      flake = false;
    };
    tree-sitter-gas = {
      url = "github:sirius94/tree-sitter-gas";
      flake = false;
    };
    tree-sitter-gdscript = {
      url = "github:PrestonKnopp/tree-sitter-gdscript";
      flake = false;
    };
    tree-sitter-gdshader = {
      url = "github:GodOfAvacyn/tree-sitter-gdshader";
      flake = false;
    };
    tree-sitter-gemini = {
      url = "git+https://git.sr.ht/~nbsp/tree-sitter-gemini";
      flake = false;
    };
    tree-sitter-git-commit = {
      url = "github:the-mikedavis/tree-sitter-git-commit";
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
      url = "github:tree-sitter-grammars/tree-sitter-gitattributes";
      flake = false;
    };
    tree-sitter-gitcommit = {
      url = "github:gbprod/tree-sitter-gitcommit";
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
    tree-sitter-glimmer = {
      url = "github:ember-tooling/tree-sitter-glimmer";
      flake = false;
    };
    tree-sitter-glsl = {
      url = "github:tree-sitter-grammars/tree-sitter-glsl";
      flake = false;
    };
    tree-sitter-gn = {
      url = "github:tree-sitter-grammars/tree-sitter-gn";
      flake = false;
    };
    tree-sitter-gnuplot = {
      url = "github:dpezto/tree-sitter-gnuplot";
      flake = false;
    };
    tree-sitter-go = {
      url = "github:tree-sitter/tree-sitter-go";
      flake = false;
    };
    tree-sitter-godot-resource = {
      url = "github:PrestonKnopp/tree-sitter-godot-resource";
      flake = false;
    };
    tree-sitter-gomod = {
      url = "github:camdencheek/tree-sitter-go-mod";
      flake = false;
    };
    tree-sitter-gosum = {
      url = "github:tree-sitter-grammars/tree-sitter-go-sum";
      flake = false;
    };
    tree-sitter-gotmpl = {
      url = "github:ngalaiko/tree-sitter-go-template";
      flake = false;
    };
    tree-sitter-gowork = {
      url = "github:d1y/tree-sitter-go-work";
      flake = false;
    };
    tree-sitter-gpg = {
      url = "github:tree-sitter-grammars/tree-sitter-gpg-config";
      flake = false;
    };
    tree-sitter-graphql = {
      url = "github:bkegley/tree-sitter-graphql";
      flake = false;
    };
    tree-sitter-gritql = {
      url = "github:getgrit/tree-sitter-gritql";
      flake = false;
    };
    tree-sitter-groovy = {
      url = "github:murtaza64/tree-sitter-groovy";
      flake = false;
    };
    tree-sitter-gstlaunch = {
      url = "github:tree-sitter-grammars/tree-sitter-gstlaunch";
      flake = false;
    };
    tree-sitter-hack = {
      url = "github:slackhq/tree-sitter-hack";
      flake = false;
    };
    tree-sitter-hare = {
      url = "github:tree-sitter-grammars/tree-sitter-hare";
      flake = false;
    };
    tree-sitter-haskell = {
      url = "github:tree-sitter/tree-sitter-haskell";
      flake = false;
    };
    tree-sitter-haskell-persistent = {
      url = "github:MercuryTechnologies/tree-sitter-haskell-persistent";
      flake = false;
    };
    tree-sitter-haxe = {
      url = "github:vantreeseba/tree-sitter-haxe";
      flake = false;
    };
    tree-sitter-hcl = {
      url = "github:tree-sitter-grammars/tree-sitter-hcl";
      flake = false;
    };
    tree-sitter-heex = {
      url = "github:phoenixframework/tree-sitter-heex";
      flake = false;
    };
    tree-sitter-hjson = {
      url = "github:winston0410/tree-sitter-hjson";
      flake = false;
    };
    tree-sitter-hlsl = {
      url = "github:tree-sitter-grammars/tree-sitter-hlsl";
      flake = false;
    };
    tree-sitter-hlsplaylist = {
      url = "github:Freed-Wu/tree-sitter-hlsplaylist";
      flake = false;
    };
    tree-sitter-hocon = {
      url = "github:antosha417/tree-sitter-hocon";
      flake = false;
    };
    tree-sitter-hoon = {
      url = "github:urbit-pilled/tree-sitter-hoon";
      flake = false;
    };
    tree-sitter-hosts = {
      url = "github:ath3/tree-sitter-hosts";
      flake = false;
    };
    tree-sitter-html = {
      url = "github:tree-sitter/tree-sitter-html";
      flake = false;
    };
    tree-sitter-htmldjango = {
      url = "github:interdependence/tree-sitter-htmldjango";
      flake = false;
    };
    tree-sitter-http = {
      url = "github:rest-nvim/tree-sitter-http";
      flake = false;
    };
    tree-sitter-hurl = {
      url = "github:pfeiferj/tree-sitter-hurl";
      flake = false;
    };
    tree-sitter-hyprlang = {
      url = "github:tree-sitter-grammars/tree-sitter-hyprlang";
      flake = false;
    };
    tree-sitter-ic10 = {
      url = "github:Xandaros/tree-sitter-ic10";
      flake = false;
    };
    tree-sitter-idl = {
      url = "github:cathaysia/tree-sitter-idl";
      flake = false;
    };
    tree-sitter-iex = {
      url = "github:elixir-lang/tree-sitter-iex";
      flake = false;
    };
    tree-sitter-ini = {
      url = "github:justinmk/tree-sitter-ini";
      flake = false;
    };
    tree-sitter-inko = {
      url = "github:inko-lang/tree-sitter-inko";
      flake = false;
    };
    tree-sitter-integerbasic = {
      url = "github:dfgordon/tree-sitter-integerbasic";
      flake = false;
    };
    tree-sitter-ispc = {
      url = "github:tree-sitter-grammars/tree-sitter-ispc";
      flake = false;
    };
    tree-sitter-jai = {
      url = "github:adragomir/tree-sitter-jai";
      flake = false;
    };
    tree-sitter-jakt = {
      url = "github:SerenityOS/tree-sitter-jakt";
      flake = false;
    };
    tree-sitter-janet-simple = {
      url = "github:sogaiu/tree-sitter-janet-simple";
      flake = false;
    };
    tree-sitter-java = {
      url = "github:tree-sitter/tree-sitter-java";
      flake = false;
    };
    tree-sitter-javascript = {
      url = "github:tree-sitter/tree-sitter-javascript";
      flake = false;
    };
    tree-sitter-jinja2 = {
      url = "github:dbt-labs/tree-sitter-jinja2";
      flake = false;
    };
    tree-sitter-jq = {
      url = "github:flurie/tree-sitter-jq";
      flake = false;
    };
    tree-sitter-jsdoc = {
      url = "github:tree-sitter/tree-sitter-jsdoc";
      flake = false;
    };
    tree-sitter-jslt = {
      url = "github:Kuzat/tree-sitter-jslt";
      flake = false;
    };
    tree-sitter-json = {
      url = "github:tree-sitter/tree-sitter-json";
      flake = false;
    };
    tree-sitter-json5 = {
      url = "github:Joakker/tree-sitter-json5";
      flake = false;
    };
    tree-sitter-jsonc = {
      url = "gitlab:WhyNotHugo/tree-sitter-jsonc";
      flake = false;
    };
    tree-sitter-jsonnet = {
      url = "github:sourcegraph/tree-sitter-jsonnet";
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
    tree-sitter-just = {
      url = "github:IndianBoy42/tree-sitter-just";
      flake = false;
    };
    tree-sitter-kanata = {
      url = "github:postsolar/tree-sitter-kanata";
      flake = false;
    };
    tree-sitter-kcl = {
      url = "github:kcl-lang/tree-sitter-kcl";
      flake = false;
    };
    tree-sitter-kconfig = {
      url = "github:tree-sitter-grammars/tree-sitter-kconfig";
      flake = false;
    };
    tree-sitter-kdl = {
      url = "github:tree-sitter-grammars/tree-sitter-kdl";
      flake = false;
    };
    tree-sitter-kittyconf = {
      url = "github:clo4/tree-sitter-kitty-conf";
      flake = false;
    };
    tree-sitter-koka = {
      url = "github:mtoohey31/tree-sitter-koka";
      flake = false;
    };
    tree-sitter-kotlin = {
      url = "github:fwcd/tree-sitter-kotlin";
      flake = false;
    };
    tree-sitter-koto = {
      url = "github:koto-lang/tree-sitter-koto";
      flake = false;
    };
    tree-sitter-kusto = {
      url = "github:Willem-J-an/tree-sitter-kusto";
      flake = false;
    };
    tree-sitter-lalrpop = {
      url = "github:traxys/tree-sitter-lalrpop";
      flake = false;
    };
    tree-sitter-latex = {
      url = "github:latex-lsp/tree-sitter-latex";
      flake = false;
    };
    tree-sitter-ld = {
      url = "github:mtoohey31/tree-sitter-ld";
      flake = false;
    };
    tree-sitter-ldif = {
      url = "github:kepet19/tree-sitter-ldif";
      flake = false;
    };
    tree-sitter-lean = {
      url = "github:Julian/tree-sitter-lean";
      flake = false;
    };
    tree-sitter-ledger = {
      url = "github:cbarrete/tree-sitter-ledger";
      flake = false;
    };
    tree-sitter-leo = {
      url = "github:r001/tree-sitter-leo";
      flake = false;
    };
    tree-sitter-linkerscript = {
      url = "github:tree-sitter-grammars/tree-sitter-linkerscript";
      flake = false;
    };
    tree-sitter-liquid = {
      url = "github:hankthetank27/tree-sitter-liquid";
      flake = false;
    };
    tree-sitter-liquidsoap = {
      url = "github:savonet/tree-sitter-liquidsoap";
      flake = false;
    };
    tree-sitter-llvm = {
      url = "github:benwilliamgraham/tree-sitter-llvm";
      flake = false;
    };
    tree-sitter-llvm-mir = {
      url = "github:Flakebi/tree-sitter-llvm-mir";
      flake = false;
    };
    tree-sitter-log = {
      url = "github:Tudyx/tree-sitter-log";
      flake = false;
    };
    tree-sitter-loongdoc = {
      url = "github:cathaysia/tree-sitter-loongdoc";
      flake = false;
    };
    tree-sitter-lox = {
      url = "github:ajeetdsouza/tree-sitter-lox";
      flake = false;
    };
    tree-sitter-lpf = {
      url = "gitlab:TheZoq2/tree-sitter-lpf";
      flake = false;
    };
    tree-sitter-lua = {
      url = "github:tree-sitter-grammars/tree-sitter-lua";
      flake = false;
    };
    tree-sitter-luadoc = {
      url = "github:tree-sitter-grammars/tree-sitter-luadoc";
      flake = false;
    };
    tree-sitter-luap = {
      url = "github:tree-sitter-grammars/tree-sitter-luap";
      flake = false;
    };
    tree-sitter-luau = {
      url = "github:tree-sitter-grammars/tree-sitter-luau";
      flake = false;
    };
    tree-sitter-lura = {
      url = "github:aripiprazole/lura";
      flake = false;
    };
    tree-sitter-m68k = {
      url = "github:grahambates/tree-sitter-m68k";
      flake = false;
    };
    tree-sitter-magik = {
      url = "github:krn-robin/tree-sitter-magik";
      flake = false;
    };
    tree-sitter-make = {
      url = "github:alemuller/tree-sitter-make";
      flake = false;
    };
    tree-sitter-markdoc = {
      url = "github:markdoc-extra/tree-sitter-markdoc";
      flake = false;
    };
    tree-sitter-markdown = {
      url = "github:tree-sitter-grammars/tree-sitter-markdown";
      flake = false;
    };
    tree-sitter-matlab = {
      url = "github:acristoffers/tree-sitter-matlab";
      flake = false;
    };
    tree-sitter-mediawiki = {
      url = "github:Ordoviz/tree-sitter-mediawiki";
      flake = false;
    };
    tree-sitter-menhir = {
      url = "github:Kerl13/tree-sitter-menhir";
      flake = false;
    };
    tree-sitter-merlin6502 = {
      url = "github:dfgordon/tree-sitter-merlin6502";
      flake = false;
    };
    tree-sitter-mermaid = {
      url = "github:monaqa/tree-sitter-mermaid";
      flake = false;
    };
    tree-sitter-meson = {
      url = "github:tree-sitter-grammars/tree-sitter-meson";
      flake = false;
    };
    tree-sitter-mlir = {
      url = "github:artagnon/tree-sitter-mlir";
      flake = false;
    };
    tree-sitter-mojo = {
      url = "github:lsh/tree-sitter-mojo";
      flake = false;
    };
    tree-sitter-move = {
      url = "github:tzakian/tree-sitter-move";
      flake = false;
    };
    tree-sitter-move-on-aptos = {
      url = "github:aptos-labs/tree-sitter-move-on-aptos";
      flake = false;
    };
    tree-sitter-muttrc = {
      url = "github:neomutt/tree-sitter-muttrc";
      flake = false;
    };
    tree-sitter-nasl = {
      url = "github:nichtsfrei/tree-sitter-nasl";
      flake = false;
    };
    tree-sitter-nasm = {
      url = "github:naclsn/tree-sitter-nasm";
      flake = false;
    };
    tree-sitter-navi = {
      url = "github:navi-language/tree-sitter-navi";
      flake = false;
    };
    tree-sitter-navi-stream = {
      url = "github:navi-language/tree-sitter-navi-stream";
      flake = false;
    };
    tree-sitter-newick = {
      url = "github:delehef/tree-sitter-newick";
      flake = false;
    };
    tree-sitter-nextflow = {
      url = "github:edmundmiller/tree-sitter-nextflow";
      flake = false;
    };
    tree-sitter-nginx = {
      url = "gitlab:joncoole/tree-sitter-nginx";
      flake = false;
    };
    tree-sitter-nickel = {
      url = "github:nickel-lang/tree-sitter-nickel";
      flake = false;
    };
    tree-sitter-nim = {
      url = "github:alaviss/tree-sitter-nim";
      flake = false;
    };
    tree-sitter-nim-format-string = {
      url = "github:aMOPel/tree-sitter-nim-format-string";
      flake = false;
    };
    tree-sitter-ninja = {
      url = "github:alemuller/tree-sitter-ninja";
      flake = false;
    };
    tree-sitter-nix = {
      url = "github:nix-community/tree-sitter-nix";
      flake = false;
    };
    tree-sitter-noir = {
      url = "github:hhamud/tree-sitter-noir";
      flake = false;
    };
    tree-sitter-norg = {
      url = "github:nvim-neorg/tree-sitter-norg";
      flake = false;
    };
    tree-sitter-nqc = {
      url = "github:tree-sitter-grammars/tree-sitter-nqc";
      flake = false;
    };
    tree-sitter-nu = {
      url = "github:nushell/tree-sitter-nu";
      flake = false;
    };
    tree-sitter-numbat = {
      url = "github:irevoire/tree-sitter-numbat";
      flake = false;
    };
    tree-sitter-objc = {
      url = "github:tree-sitter-grammars/tree-sitter-objc";
      flake = false;
    };
    tree-sitter-objdump = {
      url = "github:ColinKennedy/tree-sitter-objdump";
      flake = false;
    };
    tree-sitter-ocaml = {
      url = "github:tree-sitter/tree-sitter-ocaml";
      flake = false;
    };
    tree-sitter-ocamllex = {
      url = "github:314eter/tree-sitter-ocamllex";
      flake = false;
    };
    tree-sitter-odin = {
      url = "github:tree-sitter-grammars/tree-sitter-odin";
      flake = false;
    };
    tree-sitter-ohm = {
      url = "github:novusnota/tree-sitter-ohm";
      flake = false;
    };
    tree-sitter-onyx = {
      url = "github:brendanfh/tree-sitter-onyx";
      flake = false;
    };
    tree-sitter-opencl = {
      url = "github:lefp/tree-sitter-opencl";
      flake = false;
    };
    tree-sitter-openscad = {
      url = "github:bollian/tree-sitter-openscad";
      flake = false;
    };
    tree-sitter-org = {
      url = "github:nvim-orgmode/tree-sitter-org";
      flake = false;
    };
    tree-sitter-pascal = {
      url = "github:Isopod/tree-sitter-pascal";
      flake = false;
    };
    tree-sitter-passwd = {
      url = "github:ath3/tree-sitter-passwd";
      flake = false;
    };
    tree-sitter-pem = {
      url = "github:tree-sitter-grammars/tree-sitter-pem";
      flake = false;
    };
    tree-sitter-perl = {
      url = "github:tree-sitter-perl/tree-sitter-perl/release";
      flake = false;
    };
    tree-sitter-pest = {
      url = "github:pest-parser/tree-sitter-pest";
      flake = false;
    };
    tree-sitter-pgn = {
      url = "github:rolandwalker/tree-sitter-pgn";
      flake = false;
    };
    tree-sitter-php = {
      url = "github:tree-sitter/tree-sitter-php";
      flake = false;
    };
    tree-sitter-phpdoc = {
      url = "github:claytonrcarter/tree-sitter-phpdoc";
      flake = false;
    };
    tree-sitter-pioasm = {
      url = "github:leo60228/tree-sitter-pioasm";
      flake = false;
    };
    tree-sitter-pkl = {
      url = "github:apple/tree-sitter-pkl";
      flake = false;
    };
    tree-sitter-plume = {
      url = "github:plume-lang/tree-sitter-plume";
      flake = false;
    };
    tree-sitter-po = {
      url = "github:tree-sitter-grammars/tree-sitter-po";
      flake = false;
    };
    tree-sitter-pod = {
      url = "github:tree-sitter-perl/tree-sitter-pod/release";
      flake = false;
    };
    tree-sitter-poe-filter = {
      url = "github:tree-sitter-grammars/tree-sitter-poe-filter";
      flake = false;
    };
    tree-sitter-pony = {
      url = "github:tree-sitter-grammars/tree-sitter-pony";
      flake = false;
    };
    tree-sitter-ponylang = {
      url = "github:mfelsche/tree-sitter-ponylang";
      flake = false;
    };
    tree-sitter-poweron = {
      url = "github:phileagleson/tree-sitter-poweron";
      flake = false;
    };
    tree-sitter-powershell = {
      url = "github:airbus-cert/tree-sitter-powershell";
      flake = false;
    };
    tree-sitter-printf = {
      url = "github:tree-sitter-grammars/tree-sitter-printf";
      flake = false;
    };
    tree-sitter-prisma = {
      url = "github:victorhqc/tree-sitter-prisma";
      flake = false;
    };
    tree-sitter-promela = {
      url = "github:siraben/tree-sitter-promela";
      flake = false;
    };
    tree-sitter-promql = {
      url = "github:MichaHoffmann/tree-sitter-promql";
      flake = false;
    };
    tree-sitter-properties = {
      url = "github:tree-sitter-grammars/tree-sitter-properties";
      flake = false;
    };
    tree-sitter-proto = {
      url = "github:treywood/tree-sitter-proto";
      flake = false;
    };
    tree-sitter-protobuf = {
      url = "github:yusdacra/tree-sitter-protobuf";
      flake = false;
    };
    tree-sitter-prql = {
      url = "github:PRQL/tree-sitter-prql";
      flake = false;
    };
    tree-sitter-pug = {
      url = "github:zealot128/tree-sitter-pug";
      flake = false;
    };
    tree-sitter-puppet = {
      url = "github:tree-sitter-grammars/tree-sitter-puppet";
      flake = false;
    };
    tree-sitter-purescript = {
      url = "github:postsolar/tree-sitter-purescript";
      flake = false;
    };
    tree-sitter-pymanifest = {
      url = "github:tree-sitter-grammars/tree-sitter-pymanifest";
      flake = false;
    };
    tree-sitter-python = {
      url = "github:tree-sitter/tree-sitter-python";
      flake = false;
    };
    tree-sitter-ql = {
      url = "github:tree-sitter/tree-sitter-ql";
      flake = false;
    };
    tree-sitter-ql-dbscheme = {
      url = "github:tree-sitter/tree-sitter-ql-dbscheme";
      flake = false;
    };
    tree-sitter-qmldir = {
      url = "github:tree-sitter-grammars/tree-sitter-qmldir";
      flake = false;
    };
    tree-sitter-qmljs = {
      url = "github:yuja/tree-sitter-qmljs";
      flake = false;
    };
    tree-sitter-query = {
      url = "github:tree-sitter-grammars/tree-sitter-query";
      flake = false;
    };
    tree-sitter-r = {
      url = "github:r-lib/tree-sitter-r";
      flake = false;
    };
    tree-sitter-racket = {
      url = "github:6cdh/tree-sitter-racket";
      flake = false;
    };
    tree-sitter-ralph = {
      url = "github:alephium/tree-sitter-ralph";
      flake = false;
    };
    tree-sitter-rasi = {
      url = "github:Fymyte/tree-sitter-rasi";
      flake = false;
    };
    tree-sitter-rbs = {
      url = "github:joker1007/tree-sitter-rbs";
      flake = false;
    };
    tree-sitter-re2c = {
      url = "github:tree-sitter-grammars/tree-sitter-re2c";
      flake = false;
    };
    tree-sitter-readline = {
      url = "github:tree-sitter-grammars/tree-sitter-readline";
      flake = false;
    };
    tree-sitter-rec = {
      url = "github:thmsmlr/tree-sitter-rec";
      flake = false;
    };
    tree-sitter-regex = {
      url = "github:tree-sitter/tree-sitter-regex";
      flake = false;
    };
    tree-sitter-rego = {
      url = "github:FallenAngel97/tree-sitter-rego";
      flake = false;
    };
    tree-sitter-requirements = {
      url = "github:tree-sitter-grammars/tree-sitter-requirements";
      flake = false;
    };
    tree-sitter-rescript = {
      url = "github:rescript-lang/tree-sitter-rescript";
      flake = false;
    };
    tree-sitter-rifleconfig = {
      url = "github:seanbreckenridge/tree-sitter-rifleconfig";
      flake = false;
    };
    tree-sitter-rnoweb = {
      url = "github:bamonroe/tree-sitter-rnoweb";
      flake = false;
    };
    tree-sitter-robot = {
      url = "github:Hubro/tree-sitter-robot";
      flake = false;
    };
    tree-sitter-roc = {
      url = "github:nat-418/tree-sitter-roc";
      flake = false;
    };
    tree-sitter-ron = {
      url = "github:tree-sitter-grammars/tree-sitter-ron";
      flake = false;
    };
    tree-sitter-rpmspec = {
      url = "gitlab:cryptomilk/tree-sitter-rpmspec";
      flake = false;
    };
    tree-sitter-rslox = {
      url = "github:boycgit/tree-sitter-rslox";
      flake = false;
    };
    tree-sitter-rst = {
      url = "github:stsewd/tree-sitter-rst";
      flake = false;
    };
    tree-sitter-rstml = {
      url = "github:rayliwell/tree-sitter-rstml";
      flake = false;
    };
    tree-sitter-rtf = {
      url = "github:GoodNotes/tree-sitter-rtf";
      flake = false;
    };
    tree-sitter-ruby = {
      url = "github:tree-sitter/tree-sitter-ruby";
      flake = false;
    };
    tree-sitter-rust = {
      url = "github:tree-sitter/tree-sitter-rust";
      flake = false;
    };
    tree-sitter-satysfi = {
      url = "github:monaqa/tree-sitter-satysfi";
      flake = false;
    };
    tree-sitter-scala = {
      url = "github:tree-sitter/tree-sitter-scala";
      flake = false;
    };
    tree-sitter-scfg = {
      url = "git+https://git.sr.ht/~rockorager/tree-sitter-scfg";
      flake = false;
    };
    tree-sitter-scheme = {
      url = "github:6cdh/tree-sitter-scheme";
      flake = false;
    };
    tree-sitter-scss = {
      url = "github:serenadeai/tree-sitter-scss";
      flake = false;
    };
    tree-sitter-sdml = {
      url = "github:sdm-lang/tree-sitter-sdml";
      flake = false;
    };
    tree-sitter-semver = {
      url = "github:uselessscat/tree-sitter-semver";
      flake = false;
    };
    tree-sitter-slang = {
      url = "github:tree-sitter-grammars/tree-sitter-slang";
      flake = false;
    };
    tree-sitter-slint = {
      url = "github:slint-ui/tree-sitter-slint";
      flake = false;
    };
    tree-sitter-smali = {
      url = "github:tree-sitter-grammars/tree-sitter-smali";
      flake = false;
    };
    tree-sitter-smarty = {
      url = "github:Kibadda/tree-sitter-smarty";
      flake = false;
    };
    tree-sitter-smithy = {
      url = "github:indoorvivants/tree-sitter-smithy";
      flake = false;
    };
    tree-sitter-sml = {
      url = "github:Giorbo/tree-sitter-sml";
      flake = false;
    };
    tree-sitter-snakemake = {
      url = "github:osthomas/tree-sitter-snakemake";
      flake = false;
    };
    tree-sitter-solidity = {
      url = "github:JoranHonig/tree-sitter-solidity";
      flake = false;
    };
    tree-sitter-souffle = {
      url = "github:langston-barrett/tree-sitter-souffle";
      flake = false;
    };
    tree-sitter-sourcepawn = {
      url = "github:nilshelmig/tree-sitter-sourcepawn";
      flake = false;
    };
    tree-sitter-spade = {
      url = "gitlab:spade-lang/tree-sitter-spade";
      flake = false;
    };
    tree-sitter-sparql = {
      url = "github:GordianDziwis/tree-sitter-sparql";
      flake = false;
    };
    tree-sitter-spicedb = {
      url = "github:authzed/tree-sitter-spicedb";
      flake = false;
    };
    tree-sitter-sql = {
      url = "github:DerekStride/tree-sitter-sql";
      flake = false;
    };
    tree-sitter-sql-bigquery = {
      url = "github:takegue/tree-sitter-sql-bigquery";
      flake = false;
    };
    tree-sitter-squirrel = {
      url = "github:tree-sitter-grammars/tree-sitter-squirrel";
      flake = false;
    };
    tree-sitter-ssh-client-config = {
      url = "github:metio/tree-sitter-ssh-client-config";
      flake = false;
    };
    tree-sitter-ssh-config = {
      url = "github:tree-sitter-grammars/tree-sitter-ssh-config";
      flake = false;
    };
    tree-sitter-starlark = {
      url = "github:tree-sitter-grammars/tree-sitter-starlark";
      flake = false;
    };
    tree-sitter-strace = {
      url = "github:sigmaSd/tree-sitter-strace";
      flake = false;
    };
    tree-sitter-strings = {
      url = "github:uber/tree-sitter-strings";
      flake = false;
    };
    tree-sitter-styled = {
      url = "github:mskelton/tree-sitter-styled";
      flake = false;
    };
    tree-sitter-supercollider = {
      url = "github:madskjeldgaard/tree-sitter-supercollider";
      flake = false;
    };
    tree-sitter-surface = {
      url = "github:connorlay/tree-sitter-surface";
      flake = false;
    };
    tree-sitter-surrealdb = {
      url = "github:DariusCorvus/tree-sitter-surrealdb";
      flake = false;
    };
    tree-sitter-svelte = {
      url = "github:tree-sitter-grammars/tree-sitter-svelte";
      flake = false;
    };
    tree-sitter-sway = {
      url = "github:FuelLabs/tree-sitter-sway";
      flake = false;
    };
    tree-sitter-swift = {
      url = "github:alex-pinkus/tree-sitter-swift";
      flake = false;
    };
    tree-sitter-sxhkdrc = {
      url = "github:RaafatTurki/tree-sitter-sxhkdrc";
      flake = false;
    };
    tree-sitter-syncat-stylesheet = {
      url = "github:foxfriends/syncat";
      flake = false;
    };
    tree-sitter-systemrdl = {
      url = "github:SystemRDL/tree-sitter-systemrdl";
      flake = false;
    };
    tree-sitter-systemtap = {
      url = "github:ok-ryoko/tree-sitter-systemtap";
      flake = false;
    };
    tree-sitter-t32 = {
      url = "gitlab:xasc/tree-sitter-t32";
      flake = false;
    };
    tree-sitter-tablegen = {
      url = "github:tree-sitter-grammars/tree-sitter-tablegen";
      flake = false;
    };
    tree-sitter-tact = {
      url = "github:tact-lang/tree-sitter-tact";
      flake = false;
    };
    tree-sitter-talon = {
      url = "github:wenkokke/tree-sitter-talon";
      flake = false;
    };
    tree-sitter-task = {
      url = "github:alexanderbrevig/tree-sitter-task";
      flake = false;
    };
    tree-sitter-taskjuggler = {
      url = "gitlab:bricka/tree-sitter-taskjuggler";
      flake = false;
    };
    tree-sitter-tcl = {
      url = "github:tree-sitter-grammars/tree-sitter-tcl";
      flake = false;
    };
    tree-sitter-teal = {
      url = "github:euclidianAce/tree-sitter-teal";
      flake = false;
    };
    tree-sitter-templ = {
      url = "github:vrischmann/tree-sitter-templ";
      flake = false;
    };
    tree-sitter-textproto = {
      url = "github:PorterAtGoogle/tree-sitter-textproto";
      flake = false;
    };
    tree-sitter-thrift = {
      url = "github:tree-sitter-grammars/tree-sitter-thrift";
      flake = false;
    };
    tree-sitter-tiger = {
      url = "github:ambroisie/tree-sitter-tiger";
      flake = false;
    };
    tree-sitter-tlaplus = {
      url = "github:tlaplus-community/tree-sitter-tlaplus";
      flake = false;
    };
    tree-sitter-tmux = {
      url = "github:Freed-Wu/tree-sitter-tmux";
      flake = false;
    };
    tree-sitter-todotxt = {
      url = "github:arnarg/tree-sitter-todotxt";
      flake = false;
    };
    tree-sitter-toml = {
      url = "github:tree-sitter-grammars/tree-sitter-toml";
      flake = false;
    };
    tree-sitter-tsq = {
      url = "github:the-mikedavis/tree-sitter-tsq";
      flake = false;
    };
    tree-sitter-turbowave = {
      url = "github:dfgordon/tree-sitter-turbowave";
      flake = false;
    };
    tree-sitter-turtle = {
      url = "github:GordianDziwis/tree-sitter-turtle";
      flake = false;
    };
    tree-sitter-twig = {
      url = "github:gbprod/tree-sitter-twig";
      flake = false;
    };
    tree-sitter-typescript = {
      url = "github:tree-sitter/tree-sitter-typescript";
      flake = false;
    };
    tree-sitter-typespec = {
      url = "github:happenslol/tree-sitter-typespec";
      flake = false;
    };
    tree-sitter-typoscript = {
      url = "github:Teddytrombone/tree-sitter-typoscript";
      flake = false;
    };
    tree-sitter-typst = {
      url = "github:uben0/tree-sitter-typst";
      flake = false;
    };
    tree-sitter-udev = {
      url = "github:tree-sitter-grammars/tree-sitter-udev";
      flake = false;
    };
    tree-sitter-uiua = {
      url = "github:shnarazk/tree-sitter-uiua";
      flake = false;
    };
    tree-sitter-ungrammar = {
      url = "github:tree-sitter-grammars/tree-sitter-ungrammar";
      flake = false;
    };
    tree-sitter-unifieddiff = {
      url = "github:monaqa/tree-sitter-unifieddiff";
      flake = false;
    };
    tree-sitter-unison = {
      url = "github:kylegoetz/tree-sitter-unison";
      flake = false;
    };
    tree-sitter-uri = {
      url = "github:atusy/tree-sitter-uri";
      flake = false;
    };
    tree-sitter-ursa = {
      url = "github:ursalang/tree-sitter-ursa";
      flake = false;
    };
    tree-sitter-usd = {
      url = "github:ColinKennedy/tree-sitter-usd";
      flake = false;
    };
    tree-sitter-uxntal = {
      url = "github:tree-sitter-grammars/tree-sitter-uxntal";
      flake = false;
    };
    tree-sitter-v = {
      url = "github:vlang/v-analyzer";
      flake = false;
    };
    tree-sitter-vala = {
      url = "github:vala-lang/tree-sitter-vala";
      flake = false;
    };
    tree-sitter-vento = {
      url = "github:ventojs/tree-sitter-vento";
      flake = false;
    };
    tree-sitter-verilog = {
      url = "github:tree-sitter/tree-sitter-verilog";
      flake = false;
    };
    tree-sitter-vhdl = {
      url = "github:teburd/tree-sitter-vhdl";
      flake = false;
    };
    tree-sitter-vhs = {
      url = "github:charmbracelet/tree-sitter-vhs";
      flake = false;
    };
    tree-sitter-vim = {
      url = "github:tree-sitter-grammars/tree-sitter-vim";
      flake = false;
    };
    tree-sitter-vimdoc = {
      url = "github:neovim/tree-sitter-vimdoc";
      flake = false;
    };
    tree-sitter-vue = {
      url = "github:tree-sitter-grammars/tree-sitter-vue/main";
      flake = false;
    };
    tree-sitter-wat = {
      url = "github:wasm-lsp/tree-sitter-wasm";
      flake = false;
    };
    tree-sitter-wdl = {
      url = "github:jdidion/tree-sitter-wdl";
      flake = false;
    };
    tree-sitter-wenyan = {
      url = "github:duskmoon314/tree-sitter-wenyan";
      flake = false;
    };
    tree-sitter-wgsl = {
      url = "github:szebniok/tree-sitter-wgsl";
      flake = false;
    };
    tree-sitter-wgsl-bevy = {
      url = "github:tree-sitter-grammars/tree-sitter-wgsl-bevy";
      flake = false;
    };
    tree-sitter-wing = {
      url = "github:winglang/tree-sitter-wing";
      flake = false;
    };
    tree-sitter-wit = {
      url = "github:liamwh/tree-sitter-wit";
      flake = false;
    };
    tree-sitter-wren = {
      url = "git+https://git.sr.ht/~jummit/tree-sitter-wren";
      flake = false;
    };
    tree-sitter-xcompose = {
      url = "github:tree-sitter-grammars/tree-sitter-xcompose";
      flake = false;
    };
    tree-sitter-xidoc = {
      url = "git+https://git.sr.ht/~xigoi/tree-sitter-xidoc";
      flake = false;
    };
    tree-sitter-xit = {
      url = "github:synaptiko/tree-sitter-xit";
      flake = false;
    };
    tree-sitter-xml = {
      url = "github:tree-sitter-grammars/tree-sitter-xml";
      flake = false;
    };
    tree-sitter-xtc = {
      url = "github:Alexis-Lapierre/tree-sitter-xtc";
      flake = false;
    };
    tree-sitter-yaml = {
      url = "github:tree-sitter-grammars/tree-sitter-yaml";
      flake = false;
    };
    tree-sitter-yang = {
      url = "github:Hubro/tree-sitter-yang";
      flake = false;
    };
    tree-sitter-yasnippet = {
      url = "github:nverno/tree-sitter-yasnippet";
      flake = false;
    };
    tree-sitter-yuck = {
      url = "github:tree-sitter-grammars/tree-sitter-yuck";
      flake = false;
    };
    tree-sitter-zathurarc = {
      url = "github:Freed-Wu/tree-sitter-zathurarc";
      flake = false;
    };
    tree-sitter-zeek = {
      url = "github:zeek/tree-sitter-zeek";
      flake = false;
    };
    tree-sitter-zig = {
      url = "github:maxxnino/tree-sitter-zig";
      flake = false;
    };
    tree-sitter-zscript = {
      url = "github:dastrukar/tree-sitter-zscript";
      flake = false;
    };
  };
}
