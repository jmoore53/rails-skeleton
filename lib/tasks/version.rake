task :create_version do
    desc "create VERSION.  Use MAJOR_VERSION, MINOR_VERSION, BUILD_VERSION to override defaults"

    version_file = "#{Rails.root}/version.txt"
    major = ENV["MAJOR_VERSION"] || 1
    minor = ENV["MINOR_VERSION"] || 0
    revision = ENV["REVISION_NUMBER"] || 0
    build = ENV["BUILD_VERSION"] || `git describe --always --tags`
    version_string = "#{major.to_s + "." + minor.to_s + "." + revision.to_s}\n"
    File.open(version_file, "w") {|f| 
        f.print(version_string)
        f.print(build)
    }
    $stderr.print(version_string)
    $stderr.print(build)
end

