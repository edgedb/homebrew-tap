class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1009"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1009+2c661ca",
        using: :nounzip
      sha256 "462e3135f09f201c8b7bf34c5dca88f4c7cc28d222e1082f57cde004f5fc5317"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1009+2c661ca" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1009+1e046a7",
        using: :nounzip
      sha256 "fb58148e1e8a7220394256991991dafd4ed9407479a126ebd2377d2d3db4092d"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1009+1e046a7" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1009+ca1a330",
        using: :nounzip
      sha256 "2719b31ffa3c55615d1874de3e75bc5628af421b30700be78f9d80c5daa1dfd8"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1009+ca1a330" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1009+a2da0a2",
        using: :nounzip
      sha256 "094346cb49acda57a58df24451c29b1b02d802fa101d5ed74e4e032fe918b56f"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1009+a2da0a2" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
