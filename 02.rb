def find_all_file_paths_of_depth_starting_with(from, to, search, path, original_path = nil)
  original_path ||= path
  matched = []
  puts original_path
  Dir.children(path).each do |entry|
    entry_path = File.join(path, entry)
    find_all_file_paths_of_depth_starting_with(from - 1, to - 1, search, entry_path, original_path) if File.directory?(entry_path)
    matched << entry_path if entry.start_with?(search)
  end
  puts matched
end

find_all_file_paths_of_depth_starting_with(2, 3, "hu", "/Users/dimitrirutz/Downloads")
