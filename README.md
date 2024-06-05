# Nix tree-sitter parsers

## Usage

- Build `default` package for all tree-sitter parsers,

```sh
nix build github:ratson/nix-treesitter
```

- Build individual grammar, e.g. C

```sh
nix build github:ratson/nix-treesitter#tree-sitter-c
```

## Supported languages

<!--grammars-->

| Grammar           | Last Modified                                                                   |
| ----------------- | ------------------------------------------------------------------------------- |
| adl               | [2024-04-03](https://github.com/adl-lang/tree-sitter-adl)                       |
| agda              | [2024-02-15](https://github.com/tree-sitter/tree-sitter-agda)                   |
| angular           | [2024-05-07](https://github.com/dlvandenberg/tree-sitter-angular)               |
| arduino           | [2024-06-02](https://github.com/tree-sitter-grammars/tree-sitter-arduino)       |
| asciidoc          | [2024-06-06](https://github.com/cathaysia/tree-sitter-asciidoc)                 |
| asciidoc-inline   | [2024-06-06](https://github.com/cathaysia/tree-sitter-asciidoc)                 |
| asm               | [2024-04-24](https://github.com/RubixDev/tree-sitter-asm)                       |
| astro             | [2024-04-23](https://github.com/virchau13/tree-sitter-astro)                    |
| bash              | [2024-05-06](https://github.com/tree-sitter/tree-sitter-bash)                   |
| beancount         | [2024-03-29](https://github.com/polarmutex/tree-sitter-beancount)               |
| bibtex            | [2021-03-26](https://github.com/latex-lsp/tree-sitter-bibtex)                   |
| bicep             | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-bicep)         |
| bitbake           | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-bitbake)       |
| blade             | [2024-02-27](https://github.com/EmranMR/tree-sitter-blade)                      |
| bp                | [2024-05-13](https://github.com/ambroisie/tree-sitter-bp)                       |
| c                 | [2024-05-31](https://github.com/tree-sitter/tree-sitter-c)                      |
| c-sharp           | [2024-05-07](https://github.com/tree-sitter/tree-sitter-c-sharp)                |
| cairo             | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-cairo)         |
| capnp             | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-capnp)         |
| carbon            | [2024-06-06](https://github.com/carbon-language/carbon-lang)                    |
| cel               | [2024-02-13](https://github.com/bufbuild/tree-sitter-cel)                       |
| chatito           | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-chatito)       |
| clojure           | [2024-05-22](https://github.com/sogaiu/tree-sitter-clojure)                     |
| cmake             | [2024-06-05](https://github.com/uyha/tree-sitter-cmake)                         |
| comment           | [2024-05-08](https://github.com/stsewd/tree-sitter-comment)                     |
| commonlisp        | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-commonlisp)    |
| corn              | [2023-06-16](https://github.com/corn-config/tree-sitter-corn)                   |
| cpon              | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-cpon)          |
| cpp               | [2024-06-04](https://github.com/tree-sitter/tree-sitter-cpp)                    |
| crystal           | [2024-05-28](https://github.com/crystal-lang-tools/tree-sitter)                 |
| css               | [2024-05-05](https://github.com/tree-sitter/tree-sitter-css)                    |
| csv               | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-csv)           |
| cuda              | [2024-05-28](https://github.com/tree-sitter-grammars/tree-sitter-cuda)          |
| cue               | [2024-03-12](https://github.com/eonpatapon/tree-sitter-cue)                     |
| d                 | [2024-03-23](https://github.com/gdamore/tree-sitter-d)                          |
| dart              | [2024-04-28](https://github.com/UserNobody14/tree-sitter-dart)                  |
| dbml              | [2023-11-02](https://github.com/dynamotn/tree-sitter-dbml)                      |
| diff              | [2024-05-13](https://github.com/the-mikedavis/tree-sitter-diff)                 |
| dockerfile        | [2024-05-09](https://github.com/camdencheek/tree-sitter-dockerfile)             |
| dotbox            | [2022-11-27](https://github.com/jakehamilton/tree-sitter-dotbox)                |
| doxygen           | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-doxygen)       |
| dtd               | [2024-05-10](https://github.com/tree-sitter-grammars/tree-sitter-xml)           |
| edoc              | [2022-11-23](https://github.com/the-mikedavis/tree-sitter-edoc)                 |
| eiffel            | [2024-06-05](https://github.com/imustafin/tree-sitter-eiffel)                   |
| elixir            | [2024-06-05](https://github.com/elixir-lang/tree-sitter-elixir)                 |
| elm               | [2024-02-18](https://github.com/elm-tooling/tree-sitter-elm)                    |
| elvish            | [2023-07-17](https://github.com/elves/tree-sitter-elvish)                       |
| embedded-template | [2024-05-06](https://github.com/tree-sitter/tree-sitter-embedded-template)      |
| erlang            | [2024-05-23](https://github.com/WhatsApp/tree-sitter-erlang)                    |
| esdl              | [2022-09-05](https://github.com/matoous/tree-sitter-esdl)                       |
| exograph          | [2024-05-26](https://github.com/exograph/tree-sitter-exograph)                  |
| fennel            | [2024-05-31](https://github.com/alexmozaidze/tree-sitter-fennel)                |
| fidl              | [2024-02-27](https://github.com/google/tree-sitter-fidl)                        |
| firrtl            | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-firrtl)        |
| fish              | [2024-04-02](https://github.com/ram02z/tree-sitter-fish)                        |
| forester          | [2024-02-11](https://github.com/kentookura/tree-sitter-forester)                |
| fsharp            | [2024-06-03](https://github.com/ionide/tree-sitter-fsharp)                      |
| func              | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-func)          |
| gap               | [2024-05-26](https://github.com/gap-system/tree-sitter-gap)                     |
| gas               | [2023-09-15](https://github.com/sirius94/tree-sitter-gas)                       |
| git-commit        | [2023-08-04](https://github.com/the-mikedavis/tree-sitter-git-commit)           |
| git-config        | [2023-09-26](https://github.com/the-mikedavis/tree-sitter-git-config)           |
| git-rebase        | [2023-02-17](https://github.com/the-mikedavis/tree-sitter-git-rebase)           |
| gitattributes     | [2024-02-28](https://github.com/tree-sitter-grammars/tree-sitter-gitattributes) |
| gitcommit         | [2024-04-03](https://github.com/gbprod/tree-sitter-gitcommit)                   |
| gitignore         | [2022-05-04](https://github.com/shunsambongi/tree-sitter-gitignore)             |
| gleam             | [2024-05-29](https://github.com/gleam-lang/tree-sitter-gleam)                   |
| glimmer           | [2024-03-19](https://github.com/ember-tooling/tree-sitter-glimmer)              |
| glsl              | [2024-05-28](https://github.com/tree-sitter-grammars/tree-sitter-glsl)          |
| gn                | [2023-10-22](https://github.com/tree-sitter-grammars/tree-sitter-gn)            |
| gnuplot           | [2024-03-23](https://github.com/dpezto/tree-sitter-gnuplot)                     |
| go                | [2024-05-10](https://github.com/tree-sitter/tree-sitter-go)                     |
| gosum             | [2023-05-13](https://github.com/tree-sitter-grammars/tree-sitter-go-sum)        |
| gotmpl            | [2024-05-17](https://github.com/ngalaiko/tree-sitter-go-template)               |
| gowork            | [2024-01-31](https://github.com/d1y/tree-sitter-go-work)                        |
| gpg               | [2024-03-02](https://github.com/tree-sitter-grammars/tree-sitter-gpg-config)    |
| gritql            | [2024-04-11](https://github.com/getgrit/tree-sitter-gritql)                     |
| groovy            | [2024-04-16](https://github.com/murtaza64/tree-sitter-groovy)                   |
| gstlaunch         | [2024-04-06](https://github.com/tree-sitter-grammars/tree-sitter-gstlaunch)     |
| hack              | [2023-08-29](https://github.com/slackhq/tree-sitter-hack)                       |
| hare              | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-hare)          |
| haskell           | [2024-05-05](https://github.com/tree-sitter/tree-sitter-haskell)                |
| haxe              | [2024-05-29](https://github.com/vantreeseba/tree-sitter-haxe)                   |
| hcl               | [2024-03-08](https://github.com/tree-sitter-grammars/tree-sitter-hcl)           |
| heex              | [2024-03-13](https://github.com/phoenixframework/tree-sitter-heex)              |
| hlsl              | [2024-05-28](https://github.com/tree-sitter-grammars/tree-sitter-hlsl)          |
| hosts             | [2022-12-01](https://github.com/ath3/tree-sitter-hosts)                         |
| html              | [2024-05-04](https://github.com/tree-sitter/tree-sitter-html)                   |
| htmldjango        | [2024-03-15](https://github.com/interdependence/tree-sitter-htmldjango)         |
| http              | [2024-04-19](https://github.com/rest-nvim/tree-sitter-http)                     |
| hurl              | [2024-03-23](https://github.com/pfeiferj/tree-sitter-hurl)                      |
| hyprlang          | [2024-03-25](https://github.com/tree-sitter-grammars/tree-sitter-hyprlang)      |
| iex               | [2022-01-08](https://github.com/elixir-lang/tree-sitter-iex)                    |
| ini               | [2024-05-28](https://github.com/justinmk/tree-sitter-ini)                       |
| inko              | [2024-05-27](https://github.com/inko-lang/tree-sitter-inko)                     |
| ispc              | [2023-08-14](https://github.com/tree-sitter-grammars/tree-sitter-ispc)          |
| java              | [2024-04-07](https://github.com/tree-sitter/tree-sitter-java)                   |
| javascript        | [2024-05-31](https://github.com/tree-sitter/tree-sitter-javascript)             |
| jinja2            | [2024-01-22](https://github.com/dbt-labs/tree-sitter-jinja2)                    |
| jsdoc             | [2024-05-06](https://github.com/tree-sitter/tree-sitter-jsdoc)                  |
| json              | [2024-05-06](https://github.com/tree-sitter/tree-sitter-json)                   |
| jsonc             | [2021-03-07](https://gitlab.com/WhyNotHugo/tree-sitter-jsonc)                   |
| juice             | [2024-03-14](https://github.com/juicelang/tree-sitter-juice)                    |
| julia             | [2024-05-29](https://github.com/tree-sitter/tree-sitter-julia)                  |
| kanata            | [2024-04-20](https://github.com/postsolar/tree-sitter-kanata)                   |
| kcl               | [2024-06-05](https://github.com/kcl-lang/tree-sitter-kcl)                       |
| kconfig           | [2024-02-01](https://github.com/tree-sitter-grammars/tree-sitter-kconfig)       |
| kdl               | [2024-02-01](https://github.com/tree-sitter-grammars/tree-sitter-kdl)           |
| kittyconf         | [2023-03-24](https://github.com/clo4/tree-sitter-kitty-conf)                    |
| kotlin            | [2024-05-07](https://github.com/fwcd/tree-sitter-kotlin)                        |
| koto              | [2024-06-03](https://github.com/koto-lang/tree-sitter-koto)                     |
| latex             | [2024-04-28](https://github.com/latex-lsp/tree-sitter-latex)                    |
| ld                | [2024-04-12](https://github.com/mtoohey31/tree-sitter-ld)                       |
| ldif              | [2023-05-27](https://github.com/kepet19/tree-sitter-ldif)                       |
| lean              | [2022-06-23](https://github.com/Julian/tree-sitter-lean)                        |
| linkerscript      | [2023-11-19](https://github.com/tree-sitter-grammars/tree-sitter-linkerscript)  |
| liquid            | [2024-03-29](https://github.com/hankthetank27/tree-sitter-liquid)               |
| liquidsoap        | [2024-05-19](https://github.com/savonet/tree-sitter-liquidsoap)                 |
| llvm-mir          | [2021-12-30](https://github.com/Flakebi/tree-sitter-llvm-mir)                   |
| log               | [2023-11-26](https://github.com/Tudyx/tree-sitter-log)                          |
| lpf               | [2023-10-13](https://gitlab.com/TheZoq2/tree-sitter-lpf)                        |
| lua               | [2024-03-11](https://github.com/tree-sitter-grammars/tree-sitter-lua)           |
| luadoc            | [2024-02-09](https://github.com/tree-sitter-grammars/tree-sitter-luadoc)        |
| luap              | [2023-07-27](https://github.com/tree-sitter-grammars/tree-sitter-luap)          |
| luau              | [2024-05-24](https://github.com/tree-sitter-grammars/tree-sitter-luau)          |
| markdoc           | [2023-07-30](https://github.com/markdoc-extra/tree-sitter-markdoc)              |
| markdown          | [2024-04-02](https://github.com/tree-sitter-grammars/tree-sitter-markdown)      |
| markdown-inline   | [2024-04-02](https://github.com/tree-sitter-grammars/tree-sitter-markdown)      |
| mermaid           | [2024-04-22](https://github.com/monaqa/tree-sitter-mermaid)                     |
| meson             | [2024-03-26](https://github.com/tree-sitter-grammars/tree-sitter-meson)         |
| mojo              | [2024-06-05](https://github.com/lsh/tree-sitter-mojo)                           |
| move              | [2024-06-05](https://github.com/tzakian/tree-sitter-move)                       |
| muttrc            | [2024-04-22](https://github.com/neomutt/tree-sitter-muttrc)                     |
| nginx             | [2024-04-06](https://gitlab.com/joncoole/tree-sitter-nginx)                     |
| nickel            | [2024-06-04](https://github.com/nickel-lang/tree-sitter-nickel)                 |
| nim               | [2024-04-17](https://github.com/alaviss/tree-sitter-nim)                        |
| ninja             | [2022-01-07](https://github.com/alemuller/tree-sitter-ninja)                    |
| nix               | [2024-04-03](https://github.com/nix-community/tree-sitter-nix)                  |
| norg              | [2024-04-19](https://github.com/nvim-neorg/tree-sitter-norg)                    |
| nqc               | [2023-08-31](https://github.com/tree-sitter-grammars/tree-sitter-nqc)           |
| nu                | [2024-05-27](https://github.com/nushell/tree-sitter-nu)                         |
| numbat            | [2024-04-04](https://github.com/irevoire/tree-sitter-numbat)                    |
| objc              | [2023-08-14](https://github.com/tree-sitter-grammars/tree-sitter-objc)          |
| ocaml             | [2024-03-30](https://github.com/tree-sitter/tree-sitter-ocaml)                  |
| ocaml-interface   | [2024-03-30](https://github.com/tree-sitter/tree-sitter-ocaml)                  |
| odin              | [2024-05-21](https://github.com/tree-sitter-grammars/tree-sitter-odin)          |
| ohm               | [2024-03-24](https://github.com/novusnota/tree-sitter-ohm)                      |
| opencl            | [2023-03-30](https://github.com/lefp/tree-sitter-opencl)                        |
| openscad          | [2024-03-26](https://github.com/bollian/tree-sitter-openscad)                   |
| org               | [2024-04-20](https://github.com/nvim-orgmode/tree-sitter-org)                   |
| passwd            | [2022-12-01](https://github.com/ath3/tree-sitter-passwd)                        |
| pem               | [2024-02-28](https://github.com/tree-sitter-grammars/tree-sitter-pem)           |
| perl              | [2024-05-24](https://github.com/tree-sitter-perl/tree-sitter-perl/tree/release) |
| pest              | [2024-03-21](https://github.com/pest-parser/tree-sitter-pest)                   |
| php               | [2024-05-19](https://github.com/tree-sitter/tree-sitter-php)                    |
| php-only          | [2024-05-19](https://github.com/tree-sitter/tree-sitter-php)                    |
| pkl               | [2024-06-05](https://github.com/apple/tree-sitter-pkl)                          |
| plume             | [2024-05-26](https://github.com/plume-lang/tree-sitter-plume)                   |
| po                | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-po)            |
| pod               | [2023-11-19](https://github.com/tree-sitter-perl/tree-sitter-pod/tree/release)  |
| poe-filter        | [2024-02-28](https://github.com/tree-sitter-grammars/tree-sitter-poe-filter)    |
| pony              | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-pony)          |
| powershell        | [2024-05-30](https://github.com/airbus-cert/tree-sitter-powershell)             |
| printf            | [2024-02-23](https://github.com/tree-sitter-grammars/tree-sitter-printf)        |
| properties        | [2024-02-28](https://github.com/tree-sitter-grammars/tree-sitter-properties)    |
| proto             | [2023-08-02](https://github.com/treywood/tree-sitter-proto)                     |
| protobuf          | [2021-08-22](https://github.com/yusdacra/tree-sitter-protobuf)                  |
| psv               | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-csv)           |
| puppet            | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-puppet)        |
| pymanifest        | [2024-06-05](https://github.com/tree-sitter-grammars/tree-sitter-pymanifest)    |
| python            | [2024-05-01](https://github.com/tree-sitter/tree-sitter-python)                 |
| ql                | [2024-05-07](https://github.com/tree-sitter/tree-sitter-ql)                     |
| ql-dbscheme       | [2024-05-07](https://github.com/tree-sitter/tree-sitter-ql-dbscheme)            |
| qmldir            | [2023-03-01](https://github.com/tree-sitter-grammars/tree-sitter-qmldir)        |
| qmljs             | [2024-05-07](https://github.com/yuja/tree-sitter-qmljs)                         |
| query             | [2024-05-26](https://github.com/tree-sitter-grammars/tree-sitter-query)         |
| r                 | [2024-05-03](https://github.com/r-lib/tree-sitter-r)                            |
| racket            | [2024-04-12](https://github.com/6cdh/tree-sitter-racket)                        |
| ralph             | [2024-05-14](https://github.com/alephium/tree-sitter-ralph)                     |
| rasi              | [2024-05-21](https://github.com/Fymyte/tree-sitter-rasi)                        |
| re2c              | [2023-08-22](https://github.com/tree-sitter-grammars/tree-sitter-re2c)          |
| readline          | [2024-04-21](https://github.com/tree-sitter-grammars/tree-sitter-readline)      |
| regex             | [2024-05-06](https://github.com/tree-sitter/tree-sitter-regex)                  |
| requirements      | [2024-06-05](https://github.com/tree-sitter-grammars/tree-sitter-requirements)  |
| rescript          | [2024-06-02](https://github.com/rescript-lang/tree-sitter-rescript)             |
| rifleconfig       | [2024-06-06](https://github.com/seanbreckenridge/tree-sitter-rifleconfig)       |
| ron               | [2024-05-05](https://github.com/tree-sitter-grammars/tree-sitter-ron)           |
| rst               | [2024-04-04](https://github.com/stsewd/tree-sitter-rst)                         |
| rstml             | [2024-04-25](https://github.com/rayliwell/tree-sitter-rstml)                    |
| ruby              | [2024-05-23](https://github.com/tree-sitter/tree-sitter-ruby)                   |
| rust              | [2024-05-05](https://github.com/tree-sitter/tree-sitter-rust)                   |
| rust-with-rstml   | [2024-04-25](https://github.com/rayliwell/tree-sitter-rstml)                    |
| scala             | [2024-04-16](https://github.com/tree-sitter/tree-sitter-scala)                  |
| scheme            | [2024-04-12](https://github.com/6cdh/tree-sitter-scheme)                        |
| sdml              | [2024-05-20](https://github.com/sdm-lang/tree-sitter-sdml)                      |
| slang             | [2024-05-28](https://github.com/tree-sitter-grammars/tree-sitter-slang)         |
| slint             | [2024-06-03](https://github.com/slint-ui/tree-sitter-slint)                     |
| smali             | [2024-05-05](https://github.com/tree-sitter-grammars/tree-sitter-smali)         |
| sml               | [2022-09-04](https://github.com/Giorbo/tree-sitter-sml)                         |
| spicedb           | [2024-02-08](https://github.com/authzed/tree-sitter-spicedb)                    |
| squirrel          | [2024-05-05](https://github.com/tree-sitter-grammars/tree-sitter-squirrel)      |
| ssh-client-config | [2024-06-05](https://github.com/metio/tree-sitter-ssh-client-config)            |
| ssh-config        | [2024-04-19](https://github.com/tree-sitter-grammars/tree-sitter-ssh-config)    |
| starlark          | [2024-05-25](https://github.com/tree-sitter-grammars/tree-sitter-starlark)      |
| strace            | [2023-10-29](https://github.com/sigmaSd/tree-sitter-strace)                     |
| styled            | [2024-06-01](https://github.com/mskelton/tree-sitter-styled)                    |
| svelte            | [2024-04-10](https://github.com/tree-sitter-grammars/tree-sitter-svelte)        |
| sway              | [2023-09-06](https://github.com/FuelLabs/tree-sitter-sway)                      |
| sxhkdrc           | [2022-08-31](https://github.com/RaafatTurki/tree-sitter-sxhkdrc)                |
| tablegen          | [2024-05-05](https://github.com/tree-sitter-grammars/tree-sitter-tablegen)      |
| tact              | [2024-05-10](https://github.com/tact-lang/tree-sitter-tact)                     |
| task              | [2022-08-17](https://github.com/alexanderbrevig/tree-sitter-task)               |
| tcl               | [2024-04-11](https://github.com/tree-sitter-grammars/tree-sitter-tcl)           |
| teal              | [2024-06-03](https://github.com/euclidianAce/tree-sitter-teal)                  |
| terraform         | [2024-03-08](https://github.com/tree-sitter-grammars/tree-sitter-hcl)           |
| thrift            | [2024-04-20](https://github.com/tree-sitter-grammars/tree-sitter-thrift)        |
| tlaplus           | [2024-05-17](https://github.com/tlaplus-community/tree-sitter-tlaplus)          |
| tmux              | [2024-04-22](https://github.com/Freed-Wu/tree-sitter-tmux)                      |
| toml              | [2024-05-03](https://github.com/tree-sitter-grammars/tree-sitter-toml)          |
| tsv               | [2024-04-27](https://github.com/tree-sitter-grammars/tree-sitter-csv)           |
| tsx               | [2024-05-16](https://github.com/tree-sitter/tree-sitter-typescript)             |
| typescript        | [2024-05-16](https://github.com/tree-sitter/tree-sitter-typescript)             |
| typespec          | [2024-06-02](https://github.com/happenslol/tree-sitter-typespec)                |
| typst             | [2024-05-09](https://github.com/uben0/tree-sitter-typst)                        |
| udev              | [2024-02-28](https://github.com/tree-sitter-grammars/tree-sitter-udev)          |
| uiua              | [2024-03-11](https://github.com/shnarazk/tree-sitter-uiua)                      |
| ungrammar         | [2023-02-28](https://github.com/tree-sitter-grammars/tree-sitter-ungrammar)     |
| uxntal            | [2024-05-05](https://github.com/tree-sitter-grammars/tree-sitter-uxntal)        |
| v                 | [2024-04-20](https://github.com/vlang/v-analyzer)                               |
| vala              | [2022-06-06](https://github.com/vala-lang/tree-sitter-vala)                     |
| vento             | [2024-03-29](https://github.com/ventojs/tree-sitter-vento)                      |
| verilog           | [2024-04-27](https://github.com/tree-sitter/tree-sitter-verilog)                |
| vhdl              | [2022-01-09](https://github.com/teburd/tree-sitter-vhdl)                        |
| vim               | [2024-04-22](https://github.com/tree-sitter-grammars/tree-sitter-vim)           |
| vimdoc            | [2024-06-04](https://github.com/neovim/tree-sitter-vimdoc)                      |
| vue               | [2024-03-26](https://github.com/tree-sitter-grammars/tree-sitter-vue/tree/main) |
| wast              | [2022-05-17](https://github.com/wasm-lsp/tree-sitter-wasm)                      |
| wat               | [2022-05-17](https://github.com/wasm-lsp/tree-sitter-wasm)                      |
| wgsl-bevy         | [2024-05-24](https://github.com/tree-sitter-grammars/tree-sitter-wgsl-bevy)     |
| wing              | [2024-04-19](https://github.com/winglang/tree-sitter-wing)                      |
| wit               | [2024-05-13](https://github.com/liamwh/tree-sitter-wit)                         |
| xcompose          | [2024-02-28](https://github.com/tree-sitter-grammars/tree-sitter-xcompose)      |
| xit               | [2024-03-16](https://github.com/synaptiko/tree-sitter-xit)                      |
| xml               | [2024-05-10](https://github.com/tree-sitter-grammars/tree-sitter-xml)           |
| xtc               | [2024-04-15](https://github.com/Alexis-Lapierre/tree-sitter-xtc)                |
| yaml              | [2024-05-08](https://github.com/tree-sitter-grammars/tree-sitter-yaml)          |
| yasnippet         | [2024-05-30](https://github.com/nverno/tree-sitter-yasnippet)                   |
| yuck              | [2024-05-05](https://github.com/tree-sitter-grammars/tree-sitter-yuck)          |
| zig               | [2023-04-25](https://github.com/maxxnino/tree-sitter-zig)                       |

<!--grammars-->
