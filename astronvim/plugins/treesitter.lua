return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    indent = {
      -- enable = false,
    },
  },
  dependencies = {
    {
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    },
  },
}
