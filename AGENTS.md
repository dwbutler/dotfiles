# Repository Guidelines

## Project Structure & Module Organization
The root contains the primary dotfiles (`vimrc`, `tmux.conf`, `zshrc`, etc.) that are symlinked into `$HOME`. Environment bootstrap scripts live under `scripts/`; platform-specific installers sit in `scripts/setup/` and mixin-able helpers in `scripts/functions/` and `scripts/tools/`. Editor and terminal assets are grouped in `vim/`, `tmuxinator/`, `better_touch_tool/`, and `osx/`. User-specific overrides belong in `mixins/`; copy the `*.example` files to add machine-local aliases or credentials without committing secrets.

## Build, Test, and Development Commands
Run `scripts/setup.sh` to bootstrap a machine; it is idempotent and safe to re-run after pulls. Refresh symlinks with `scripts/makesymlinks.sh` whenever you add or rename dotfiles. Validate critical dependencies via `scripts/checkenv.sh`; it reports missing binaries and version mismatches. Use `scripts/generate_gitconfig.sh` and `scripts/generate_irssi_config.sh` to merge mixins and regenerate derived configs.

## Coding Style & Naming Conventions
Shell scripts are POSIX/Bash and follow the unofficial strict mode (`set -euo pipefail`, controlled `IFS`). Use two-space indentation and snake_case function names to match existing scripts. Keep scripts idempotent and side-effect free outside `$HOME` unless guarded by prompts. For Vim, tmux, and other config files, mirror the existing block-comment style and keep key mappings grouped by feature.

## Testing Guidelines
No formal unit test suite exists; validate changes by running `scripts/checkenv.sh` and, when editing provisioning logic, executing the relevant `scripts/setup/*.sh` in a disposable environment. For new scripts, include a `--dry-run` or descriptive usage banner so reviewers can verify behaviour without mutating state. Document manual test steps in the pull request description.

## Commit & Pull Request Guidelines
Commits in this repo use short, imperative summaries (for example, “Fix git config”, “Dump brew”). Squash incidental churn so each commit reflects a single concern. Pull requests should describe the motivation, mention any platforms exercised (macOS, Debian, etc.), and link related issues or gists. Include before/after snippets or screenshots for UI-affecting changes such as terminal profiles.

## Security & Configuration Tips
Never commit personal secrets or machine-specific tokens; store them in untracked mixins like `mixins/gitconfig.custom` or use environment variables referenced from the configs. Review generated files before symlinking to ensure permissions and paths match the target system.
