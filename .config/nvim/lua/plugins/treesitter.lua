require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    language_tree = true
  },
  indent = {
      enable = true
  },
  refactor = {
      highlight_definitions = {
          enable = true
      }
  },
  autotag = {
      enable = true
  },
  -- context_commentstring = {
  --     enable = true,
  --     config = {
  --         ccp = '// %s',
  --         cc = '// %s'
  --       }
  -- },
  textobjects = {
      select = {
          enable = true,
          keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner"
          }
      }
  }
}
