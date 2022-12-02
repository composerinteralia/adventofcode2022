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

task default: :run
