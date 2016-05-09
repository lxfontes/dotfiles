require 'irb/completion'
# Auto indenting
IRB.conf[:AUTO_INDENT]=true
# Remove the annoying irb(main):001:0 and replace with >>
IRB.conf[:PROMPT_MODE]  = :SIMPLE
# Save History between irb sessions
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
