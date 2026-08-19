return {
  cmd = { "rzk", "lsp" },
  filetypes = { "rzk" },
  root_markers = { "rzk.yaml", ".git" },
  settings = {
    rzk = {
      format = {
        enable = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    -- rzk LSP ignores textDocument/didSave and only re-typechecks on
    -- workspace/didChangeWatchedFiles. Neovim does not send file-watcher
    -- notifications by default, so we fire them manually on save.
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      group = vim.api.nvim_create_augroup("rzk_watched_files_" .. bufnr, { clear = true }),
      callback = function()
        client.notify("workspace/didChangeWatchedFiles", {
          changes = {
            {
              uri = vim.uri_from_bufnr(bufnr),
              type = 2, -- 2 = Changed
            },
          },
        })
      end,
    })
  end,
}
