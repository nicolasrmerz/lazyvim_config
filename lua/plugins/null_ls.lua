return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        nls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
        nls.builtins.formatting.isort,
        -- Ignored warning already handled by pyright
        nls.builtins.diagnostics.flake8.with({ extra_args = { "--ignore=F401,F821" } }),
      },
    }
  end,
}
