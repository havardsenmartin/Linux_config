return {
  {
    "tpope/vim-surround",
    init = function()
      vim.keymap.set("x", "gsa", "<Plug>VSurround", { remap = true })
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
    },
    opts = {
      position = "right",
    },
  },
}
