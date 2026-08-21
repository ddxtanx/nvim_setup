return {
  cmd = { "rzk", "lsp" },
  filetypes = { "rzk", "rzk.markdown" },
  root_markers = { "rzk.yaml", ".git" },
  settings = {
    rzk = {
      format = {
        enable = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    local group = vim.api.nvim_create_augroup("rzk_watched_files_" .. bufnr, { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      group = group,
      callback = function()
        client.notify("workspace/didChangeWatchedFiles", {
          changes = {
            {
              uri = vim.uri_from_bufnr(bufnr),
              type = 2, -- Changed
            },
          },
        })
      end,
    })
  end,
}
