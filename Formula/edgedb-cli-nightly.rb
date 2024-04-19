class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "4.3.0-dev.1135"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1135+4566716",
        using: :nounzip
      sha256 "36e91412cd12e9e7ad1b28ed9577494d9434d302cb9bb3027dc3aceae54ec2c3"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1135+4566716" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-4.3.0-dev.1135+4566716",
        using: :nounzip
      sha256 "f5991e2fefc0c303676f6d6cfd7f518026b76ff218e1f88ebdf6d5e36554ff1a"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1135+4566716" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1135+f9c8d90",
        using: :nounzip
      sha256 "6a76c3c3744bdc36bc0dd91bc869e6e3e98e7fe74cb0dfff8737755aac5a6726"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1135+f9c8d90" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-4.3.0-dev.1135+c3631ed",
        using: :nounzip
      sha256 "c62016a904b15c8ccec49580e0ff7c215271b628e0b0cd57d654dd25af69cd63"

      def install
        bin.install "edgedb-cli-4.3.0-dev.1135+c3631ed" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
