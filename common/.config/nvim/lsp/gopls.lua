return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  -- Prefer go.mod / go.work over .git so we don't pick a parent repo
  -- (e.g. a monorepo or a checkout that also contains a GoLand .idea/).
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      -- Ignore JetBrains / GoLand project metadata so gopls and GoLand
      -- can share a tree without fighting over generated files.
      directoryFilters = { '-.idea', '-.git', '-node_modules' },
      gofumpt = true,
    },
  },
}
