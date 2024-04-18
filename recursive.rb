def find_all_file_paths_starting_with(start, path)
  matched = []
  Dir.children(path).each do |entry|
    entry_path = File.join(path, entry)
    find_all_file_paths_starting_with(start, entry_path) if File.directory?(entry_path)
    matched << entry_path if entry.start_with?(start)
  end
  puts matched
end

find_all_file_paths_starting_with("hu", "/Users/dimitrirutz/Downloads")
