{
  description = "Tree sitter grammars";

  outputs =
    { conflake, ... }@inputs':
    conflake ./. (
      { lib, ... }:
      let
        inherit (builtins)
          attrValues
          hasAttr
          listToAttrs
          mapAttrs
          replaceStrings
          ;
        inherit (lib)
          filterAttrs
          hasPrefix
          nameValuePair
          optionalAttrs
          pipe
          removePrefix
          ;
        inherit (conflake.lib) mkVersion prefixAttrs;

        inputs = conflake.lib.flake.lock2inputs ./internal/flake.lock;

        grammarArgs = {
          alcha = {
            generate = true;
          };
          apex = {
            location = "apex";
          };
          apparmor = {
            generate = true;
          };
          asciidoc = {
            location = "tree-sitter-asciidoc";
          };
          asciidoc-inline = {
            location = "tree-sitter-asciidoc_inline";
            src = inputs.tree-sitter-asciidoc;
          };
          blame = {
            location = "ql/buramu/tree-sitter-blame";
          };
          calyx = {
            location = "calyx-lsp/tree-sitter-calyx";
          };
          carbon = {
            generate = true;
            location = "utils/treesitter";
          };
          ccomment = {
            location = "tree-sitter-ccomment";
          };
          cfml = {
            location = "cfml";
          };
          cgsql = {
            generate = true;
          };
          csv = {
            location = "csv";
          };
          darklang = {
            generate = true;
            location = "tree-sitter-darklang";
          };
          datazinc = {
            location = "parsers/tree-sitter-datazinc";
          };
          djot = {
            location = "tree-sitter-djot";
          };
          djot-inline = {
            location = "tree-sitter-djot-inline";
          };
          dotvvm = {
            generate = true;
            location = "src/tree-sitter-dotvvm";
          };
          dtd = {
            location = "dtd";
            src = inputs.tree-sitter-xml;
          };
          epics-cmd = {
            location = "epics-cmd";
          };
          epics-db = {
            location = "epics-db";
            src = inputs.tree-sitter-epics-cmd;
          };
          epics-msi-template = {
            location = "epics-msi-template";
            src = inputs.tree-sitter-epics-cmd;
          };
          eprime = {
            location = "parsers/tree-sitter-eprime";
            src = inputs.tree-sitter-datazinc;
          };
          fsharp = {
            location = "fsharp";
          };
          fsharp_signature = {
            location = "fsharp_signature";
          };
          lura = {
            location = "tree-sitter-lura";
          };
          man-db-config = {
            generate = true;
          };
          markdown-inline = {
            src = inputs.tree-sitter-markdown;
          };
          mers = {
            location = "tree-sitter-mers";
          };
          minizinc = {
            location = "parsers/tree-sitter-minizinc";
            src = inputs.tree-sitter-datazinc;
          };
          moshell = {
            generate = true;
          };
          mozcpp = {
            location = "tree-sitter-mozcpp";
          };
          mozjs = {
            location = "tree-sitter-mozjs";
          };
          nv = {
            location = "extensions/tree-sitter";
          };
          ocaml-interface = {
            src = inputs.tree-sitter-ocaml;
          };
          ocaml-type = {
            location = "grammars/type";
            src = inputs.tree-sitter-ocaml;
          };
          php-only = {
            location = "php_only";
            src = inputs.tree-sitter-php;
          };
          poweron = {
            generate = true;
          };
          preproc = {
            location = "tree-sitter-preproc";
          };
          problog = {
            location = "grammars/problog";
            src = inputs.tree-sitter-prolog;
          };
          prolog = {
            location = "grammars/prolog";
          };
          psv = {
            location = "psv";
            src = inputs.tree-sitter-csv;
          };
          qunit = {
            generate = true;
          };
          rescript = {
            generate = true;
          };
          rstml = {
            location = "rstml";
          };
          rtf = {
            generate = true;
          };
          rust-with-rstml = {
            location = "rust_with_rstml";
            src = inputs.tree-sitter-rstml;
          };
          scfg = {
            generate = true;
          };
          scilab = {
            generate = true;
          };
          snl = {
            location = "snl";
            src = inputs.tree-sitter-epics-cmd;
          };
          soql = {
            location = "soql";
            src = inputs.tree-sitter-apex;
          };
          sosl = {
            location = "sosl";
            src = inputs.tree-sitter-apex;
          };
          stilts = {
            location = "tooling/tree-sitter-stilts";
          };
          streamdevice-proto = {
            location = "streamdevice-proto";
            src = inputs.tree-sitter-epics-cmd;
          };
          swift = {
            generate = true;
          };
          syncat-stylesheet = {
            location = "tree-sitter-syncat-stylesheet";
          };
          systemrdl = {
            generate = true;
          };
          terraform = {
            location = "dialects/terraform";
            src = inputs.tree-sitter-hcl;
          };
          tsv = {
            location = "tsv";
            src = inputs.tree-sitter-csv;
          };
          tsx = {
            src = inputs.tree-sitter-typescript;
          };
          v = {
            location = "tree_sitter_v";
          };
          wast = {
            location = "wast";
            src = inputs.tree-sitter-wat;
          };
          wat = {
            location = "wat";
          };
          x12 = {
            generate = true;
          };
          xml = {
            location = "xml";
          };
          ziggy = {
            location = "tree-sitter-ziggy";
          };
          ziggy-schema = {
            location = "tree-sitter-ziggy-schema";
            src = inputs.tree-sitter-ziggy;
          };
        };

        aliasInputs = pipe grammarArgs [
          (filterAttrs (_: hasAttr "src"))
          (prefixAttrs "tree-sitter-")
          (mapAttrs (_: v: v.src))
        ];

        hasTsPrefix = hasPrefix "tree-sitter-";
        removeTsPrefix = removePrefix "tree-sitter-";
        filterTsAttrs = filterAttrs (k: _: hasTsPrefix k);

        getGrammarArgs = k: optionalAttrs (hasAttr k grammarArgs) grammarArgs.${k};

        grammars = pipe inputs [
          filterTsAttrs
          (x: x // aliasInputs)
          (mapAttrs (
            k: input: pkgs:
            if hasAttr k pkgs.tree-sitter-grammars then
              pkgs.tree-sitter-grammars.${k}.overrideAttrs (_: {
                src = input;
                version = mkVersion input;
              })
            else
              pipe k [
                removeTsPrefix
                getGrammarArgs
                (
                  x:
                  {
                    language = k;
                    src = input;
                    version = mkVersion input;
                  }
                  // x
                )
                pkgs.tree-sitter.buildGrammar
              ]
          ))
        ];

        hasRev =
          p: rev:
          let
            k = p.src.rev;
          in
          hasAttr k rev
          && pipe rev.${k}.name [
            (replaceStrings [ "_" ] [ "-" ])
            removeTsPrefix
            (hasPrefix (removeTsPrefix p.pname))
          ];

        default =
          {
            tree-sitter,
            vimPlugins,
            outputs',
            ...
          }:
          let
            revTs = pipe tree-sitter.allGrammars [
              (map (x: nameValuePair x.src.rev x))
              listToAttrs
            ];
            revVim = pipe vimPlugins.nvim-treesitter.passthru.allGrammars [
              (map (x: nameValuePair x.src.rev x))
              listToAttrs
            ];
            selfGrammars = pipe outputs'.packages [
              filterTsAttrs
              attrValues
            ];
            finalGrammars = map (
              x:
              if hasRev x revTs then
                revTs.${x.src.rev}
              else if hasRev x revVim then
                revVim.${x.src.rev}
              else
                x
            ) selfGrammars;
          in
          tree-sitter.withPlugins (
            _: vimPlugins.nvim-treesitter.passthru.allGrammars ++ tree-sitter.allGrammars ++ finalGrammars
          );
      in
      {
        # inherit inputs;
        inputs = inputs';

        packages = grammars // {
          inherit default;
        };
      }
    );

  inputs = {
    conflake = {
      url = "github:ratson/conflake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
}
