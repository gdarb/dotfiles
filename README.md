# dotfiles

Ensure that [`fish`](https://fishshell.com) and [`git`](https://git-scm.com) are installed

```sh
$ git clone https://github.com/gdarb/dotfiles.git
$ cd dotfiles
$ ./scripts/bootstrap
```

## Things to keep in mind

-   Inside each directory there should be a `_bootstrap.fish` script that sets up everything in an idempotent manner
-   Similarly there should be a `_config.fish` file in each directory that is loaded on shell launch
-   Any other files located in a directoy can either be symlinked to the relevant location by `_bootstrap.fish` or sourced by `_config.fish`
