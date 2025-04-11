require "nvchad.mappings"
local map = vim.keymap.set

-- Mapeamentos básicos
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- ====== Mapeamentos para Execução de Código ======
local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = "Code Runner" })
end

-- Verifica se o arquivo existe
local function file_exists()
  local file = vim.fn.expand("%")
  if vim.fn.filereadable(file) == 0 then
    notify("Arquivo não encontrado: " .. file, vim.log.levels.ERROR)
    return false
  end
  return true
end

-- 1. Execução com ToggleTerm (terminal flutuante) - Versão Corrigida
map("n", "<leader>rp", function()
  if vim.bo.filetype ~= "python" then
    notify("Não é um arquivo Python!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  
  local Terminal = require("toggleterm.terminal").Terminal
  local python_term = Terminal:new({
    cmd = "python3 " .. vim.fn.expand("%"),
    direction = "float",
    close_on_exit = false,
  })
  python_term:toggle()
  notify("Executando Python: " .. vim.fn.expand("%"))
end, { desc = "Run Python (interactive)" })

map("n", "<leader>rg", function()
  if vim.bo.filetype ~= "go" then
    notify("Não é um arquivo Go!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  
  local Terminal = require("toggleterm.terminal").Terminal
  local go_term = Terminal:new({
    cmd = "go run " .. vim.fn.expand("%"),
    direction = "float",
    close_on_exit = false,
  })
  go_term:toggle()
  notify("Executando Go: " .. vim.fn.expand("%"))
end, { desc = "Run Go (interactive)" })

-- 2. Execução rápida (terminal externo)
map("n", "<leader>rr", function()
  if vim.bo.filetype ~= "python" then
    notify("Não é um arquivo Python!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  vim.cmd("!python3 %")
end, { desc = "Quick Run Python (external)" })

map("n", "<leader>rR", function()
  if vim.bo.filetype ~= "go" then
    notify("Não é um arquivo Go!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  vim.cmd("!go run %")
end, { desc = "Quick Run Go (external)" })

-- 3. Utilitários
map("n", "<leader>ct", function()
  require("toggleterm").toggle()
end, { desc = "Toggle terminal" })

-- 4. Novo: Fechar terminal automaticamente após sucesso (opcional)
map("n", "<leader>rx", function()
  local term = require("toggleterm.terminal")
  term.get_all():close()
  notify("Terminais fechados", vim.log.levels.INFO)
end, { desc = "Close all terminals" })

-- Ruby execution
local function notify(msg, level)
  vim.notify(msg, level or vim.log.levels.INFO, { title = "Code Runner" })
end

-- Verifica se o arquivo existe
local function file_exists()
  local file = vim.fn.expand("%")
  if vim.fn.filereadable(file) == 0 then
    notify("Arquivo não encontrado: " .. file, vim.log.levels.ERROR)
    return false
  end
  return true
end

-- 1. Execução com ToggleTerm (terminal flutuante)
map("n", "<leader>rr", function() -- Ruby
  if vim.bo.filetype ~= "ruby" then
    notify("Não é um arquivo Ruby!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  
  local Terminal = require("toggleterm.terminal").Terminal
  local ruby_term = Terminal:new({
    cmd = "ruby " .. vim.fn.expand("%"),
    direction = "float",
    close_on_exit = false,
  })
  ruby_term:toggle()
  notify("Executando Ruby: " .. vim.fn.expand("%"))
end, { desc = "Run Ruby (interactive)" })

map("n", "<leader>rg", function() -- Go
  if vim.bo.filetype ~= "go" then
    notify("Não é um arquivo Go!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  
  local Terminal = require("toggleterm.terminal").Terminal
  local go_term = Terminal:new({
    cmd = "go run " .. vim.fn.expand("%"),
    direction = "float",
    close_on_exit = false,
  })
  go_term:toggle()
  notify("Executando Go: " .. vim.fn.expand("%"))
end, { desc = "Run Go (interactive)" })

-- 2. Execução rápida (terminal externo)
map("n", "<leader>rR", function() -- Ruby rápido
  if vim.bo.filetype ~= "ruby" then
    notify("Não é um arquivo Ruby!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  vim.cmd("!ruby %")
end, { desc = "Quick Run Ruby (external)" })

map("n", "<leader>rG", function() -- Go rápido
  if vim.bo.filetype ~= "go" then
    notify("Não é um arquivo Go!", vim.log.levels.ERROR)
    return
  end
  if not file_exists() then return end
  vim.cmd("!go run %")
end, { desc = "Quick Run Go (external)" })

-- 3. Utilitários
map("n", "<leader>ct", function()
  require("toggleterm").toggle()
end, { desc = "Toggle terminal" })

map("n", "<leader>rx", function()
  local term = require("toggleterm.terminal")
  term.get_all():close()
  notify("Terminais fechados", vim.log.levels.INFO)
end, { desc = "Close all terminals" })
