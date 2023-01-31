(when (featurep! :lang rust)
  (setq lsp-rust-analyzer-proc-macro-enable t)
  (setq lsp-rust-analyzer-server-display-inlay-hints t))

(setq lsp-clients-angular-language-server-command
  '("node"
    "/usr/lib/node_modules/@angular/language-server"
    "--ngProbeLocations"
    "/usr/lib/node_modules"
    "--tsProbeLocations"
    "/usr/lib/node_modules"
    "--stdio"))
