return {
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      delay = 5000,
      message_template = "<summary> • <date> • <committer> • <sha>",
      schedule_event = "CursorHold",
      clear_event = "CursorMovedI",
      date_format = "%r",
    },
  },
}
