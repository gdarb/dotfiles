# dotfiles

These are my dotfiles!

## Installation

Ensure that [`fish`](https://fishshell.com) and [`git`](https://git-scm.com) are installed.

```sh
$ git clone https://github.com/gdarb/dotfiles.git
$ cd dotfiles
$ ./scripts/bootstrap
```

## Design

-   Things are organised in topical directories
-   `scripts/bootstrap` will run a `_bootstrap.fish` file found in each directory, this script sets everything up in an **idempotent** manner
-   On shell launch, a `_config.fish` file in each directory will be sourced
-   Anything else in a directory can either be symlinked by `_bootstrap.fish` or sourced by `_config.fish`

## Notes

-   No cleanup is done on files removed from this repository (i.e. symlinks residing in `$HOME`)
-   Any files that would be overwritten by `scripts/bootstrap` are moved to a temporary directory
-   While only `fish` & `git` are required, a full list of additional software can be found in `brew/Brewfile` or by inspecting each directory

## Contributing

Commits should follow the [Conventional Commits specification](https://www.conventionalcommits.org/en/v1.0.0/).
