require 'json'

class EdgedbCliNightly < Formula
    def self.plat
        if OS.mac?
            'macos-x86_64'
        elsif OS.linux?
            if Hardware::CPU.intel?
                'linux-x86_64'
            end
        end
    end

    def self.latest_nightly_version
        indexes = JSON.parse(`curl --silent https://packages.edgedb.com/archive/.jsonindexes/#{plat}.nightly.json`)
        versions = []
        indexes['packages'].each { |package|
            next unless package['name'] == 'edgedb-cli'
            versions.push(package['version'])
        }
        versions.sort.reverse!.first
    end

    def self.download_sha256_checksum
        `curl --silent 'https://packages.edgedb.com/dist/#{plat}.nightly/edgedb-cli_latest_nightly.sha256'`.split.first
    end

    desc "Nightly build of the EdgeDB Command Line Interface (edgedb), a tool for connecting to your EdgeDB instances."
    homepage "https://github.com/edgedb/edgedb-cli"
    url "https://packages.edgedb.com/dist/#{plat}.nightly/edgedb-cli_latest_nightly?edgedb.nightly",
        :using => :nounzip
    sha256 download_sha256_checksum
    version latest_nightly_version
    bottle :unneeded

    def install
        bin.install 'edgedb.nightly' => 'edgedb-nightly'
    end

    test do
        system "#{bin}/edgedb-nightly --version"
    end
end
