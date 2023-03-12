return function(_, opts)
  local notify = require "notify"
  notify.setup(opts)
  local ot_notif = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
  end
  vim.notify = ot_notif
end
