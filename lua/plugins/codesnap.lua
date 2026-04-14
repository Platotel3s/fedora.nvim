return {
  "mistricky/codesnap.nvim",
  tag = "v2.0.0",
  build = "make",
  keys = {
    { "<F6>", ":CodeSnap<cr>", mode = "n", desc = "CodeSnap: Snapshot" },
    { "<F7>", ":CodeSnapSave<cr>", mode = "n", desc = "CodeSnap: Save" },
  },
  opts = {
    save_path = "~/Pictures/Screenshots/",
    has_line_number = true,
  },
}
