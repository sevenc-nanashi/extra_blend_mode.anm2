# frozen_string_literal: true
Dir.mkdir("build") unless Dir.exist?("build")

entry = File.read("./src/entry.hlsl")
shaders = []
Dir
  .glob("./src/modes/*.hlsl")
  .sort
  .each do |file|
    contents = File.read(file)
    label = contents.match(%r{// label: (?<label>.*)})[:label]
    id = File.basename(file, ".hlsl").sub(/^\d+_/, "")
    contents.gsub!(/#include "(.*)"/) do |match|
      include_file = File.expand_path(File.join(File.dirname(file), $1))
      File.read(include_file)
    end
    puts "Loaded shader: #{id} (#{label})"
    shaders << { id: id, label: label, contents: contents }
  end
puts "Loaded #{shaders.size} shaders"

base = File.read("./src/base.lua")
base.gsub!(
  "---!param",
  "--select@mode:合成モード=1,#{shaders.map.with_index { |shader, i| "#{shader[:label]}=#{i + 1}" }.join(",")}"
)
base.gsub!("---!shaders", shaders.map { |shader| <<~LUA }.join("\n"))
  --[[pixelshader@#{shader[:id]}:
  #define ENTRY #{shader[:id]}
  #{shader[:contents]}
  #{entry}
  ]]
LUA
base.gsub!("---!shader_list", <<~LUA)
  local shaders = {
  #{shaders.map { |shader| "    \"#{shader[:id]}\"," }.join("\n")}
  }
LUA

puts "Writing build/extra_blend_mode.anm2.anm2"
File.write("./build/extra_blend_mode.anm2.anm2", base, mode: "wb")
