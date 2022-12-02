require 'rake'

task :run, [:day] do |_, args|
  day = args.fetch(:day, "*")

  Dir.glob("day#{day}").each do |dir|
    $data = File.read("#{dir}/input")

    Dir.glob("#{dir}/*solution*").each do |file|
      puts "---- #{file}:"
      require_relative file
    end
  end
end

task :day, [:day] do |_, args|
  day = args[:day]
  mkdir "day#{day}"
  touch "day#{day}/input"
  touch "day#{day}/first_solution.rb"
end

1.upto(25).each do |i|
  file("day#{i}") { Rake::Task[:day].invoke(i) }
  task("run#{i}") { Rake::Task[:run].invoke(i) }
end

task default: :run
