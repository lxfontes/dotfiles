#!/usr/bin/env ruby

require 'optparse'
require 'fileutils'

EXCLUDED = [
  ".",
  "..",
  ".git",
  "iTerm",
  "README.md"
]
DOT_DIR    = File.expand_path(File.dirname(__FILE__))
DOTFILES   = Dir.entries(DOT_DIR).select{|f| File.directory?(File.join(DOT_DIR, f)) } - EXCLUDED
HOME       = ENV['HOME']
BACKUP_DIR = File.join(HOME, '.backup')
OPTIONS    = {}

OptionParser.new do |opts|
  opts.on('-b', '--backup', 'Backup your current dotfiles(Will delete your current ~/.backup dir)') do
    OPTIONS[:backup] = true
  end

  opts.on('-v', '--verbose', 'Verbose') do
    OPTIONS[:verbose] = true
  end

  opts.on('-h', '--help', 'Show this help message') do
    puts opts
    exit
  end
end.parse!

def all_paths(path)
  Dir.glob(path, File::FNM_DOTMATCH).select do |f|
    !EXCLUDED.include?(File.split(f).last)
  end
end

def debug(message)
  puts message if OPTIONS[:verbose]
end

def hook(name)
  debug "[HOOK] #{name} start"
  Dir.chdir(DOT_DIR)

  ret = true
  if File.exists?(name) && File.executable?(name)
#    ret = system("./#{name}")
  end

  debug "[HOOK] #{name} end"
  return ret
end

def make_backup_dir
  FileUtils.mkdir_p BACKUP_DIR
end

def backup(path)
  old_path    = File.join(HOME, path)
  backup_path = File.join(BACKUP_DIR, path)
  return unless File.exists?(old_path) && !File.directory?(old_path)
  debug("\t[BACKUP] #{old_path} -> #{backup_path}")

  target_dir = File.split(backup_path).first
  FileUtils.mkdir_p(target_dir) unless File.directory?(target_dir)
  FileUtils.cp(old_path, backup_path)
end

def symlink(path)
  src_path = File.absolute_path(path)
  dst_path = File.join(HOME, path)
  if File.exists?(dst_path)
    debug("\t[REMOVE] #{dst_path}")
    FileUtils.rm_rf dst_path, secure: true
  end
  debug("\t[LINK] #{src_path} -> #{dst_path}")
  FileUtils.ln_sf(src_path, dst_path)
end

def create_target_dir(path)
  target_dir = File.split(path).first
  return if target_dir == '.'
  debug("\t[CREATE] #{HOME}/#{target_dir}")
  FileUtils.mkdir_p("#{HOME}/#{target_dir}")
end

def symlink_base(dir)
  debug("[TARGET] #{dir}")
  all_paths('**/**').each do |path|
    create_target_dir(path)
    backup(path) if OPTIONS[:backup]
    symlink(path) unless File.directory?(path)
  end
end

def symlink_dotfiles
  DOTFILES.each do |dir|
    Dir.chdir(File.join(DOT_DIR, dir))
    symlink_base(dir)
  end
end

make_backup_dir if OPTIONS[:backup]
hook('preinstall') || abort('preinstall script failed')
symlink_dotfiles
hook('postinstall')
