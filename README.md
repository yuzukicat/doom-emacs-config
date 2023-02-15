Fonts:

```
gh repo clone cormullion/juliamono
https://www.fontsquirrel.com/fonts/tex-gyre-cursor
```

Install:

```
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
doom build
doom sync
```

LSP Language Server Plugs:(To-do)

```
sudo npm install -g @angular/language-service@next typescript @angular/language-server
sudo npm install -g vscode-langservers-extracted
sudo npm i -g graphql-language-service-cli
sudo npm i -g unified-language-server
```

Golang Dep:

```
# REPL!
go install github.com/x-motemen/gore/cmd/gore@latest

# Autocompletion
go install github.com/stamblerre/gocode@latest

# Documentation
go install golang.org/x/tools/cmd/godoc@latest

# Add/Removed Necessary Imports
go install golang.org/x/tools/cmd/goimports@latest

# Type-Safe Renaming of Go identifiers
go install golang.org/x/tools/cmd/gorename@latest

# Asks questions about your Gocode
go install golang.org/x/tools/cmd/guru@latest

# Generate tests based off of the func you're on
go install github.com/cweill/gotests/gotests@latest

# Add `json` or `bson` to structs easily
go install github.com/fatih/gomodifytags@latest
```

Fix DOOM Emacs: Error running hook "global-git-commit-mode" because: (void-variable transient-base-map) 

Refer to:

```
https://www.reddit.com/r/emacs/comments/1118o25/doom_emacs_error_running_hook_globalgitcommitmode/
```

Do:

```
cd ~/.emacs.d/.local/straight/repos/with-editor 

git fetch origin bbc60f68ac190f02da8a100b6fb67cf1c27c53ab && git checkout bbc60f68ac190f02da8a100b6fb67cf1c27c53ab 

cd ~/.emacs.d/.local/straight/repos/transient 

git fetch origin c2bdf7e12c530eb85476d3aef317eb2941ab9440 && git checkout c2bdf7e12c530eb85476d3aef317eb2941ab9440 

rm -r ~/.emacs.d/.local/straight/build-28.2/{with-editor,transient} 

doom sync
```

Thanks to github.com/citrus-lemon:

```
https://github.com/citrus-lemon/doom-emacs-config
```
