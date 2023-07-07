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
        -- Ignore warnings already handled by pyright (F401, F821)
        -- E501 is line too long which is annoyingly common
        -- W503 is "Line break occurred before a binary operator" which seems to conflict with a formatter
        nls.builtins.diagnostics.flake8.with({ extra_args = { "--ignore=F401,F821,E501,W503" } }),
      },
    }
  end,
}
