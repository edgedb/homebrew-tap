class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.2.0-dev.1002"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1002+4038237",
        using: :nounzip
      sha256 "e44f630cc7d6fdcac9ee9e14e532bc6807ee56c412a5ceddf7295a53cd2b1b54"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1002+4038237" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.2.0-dev.1002+9798f9a",
        using: :nounzip
      sha256 "4b37d6dcdce250a1e47b4018532270dd69aebda8dad405f0ab55833025ee69cf"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1002+9798f9a" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1002+34cc9ea",
        using: :nounzip
      sha256 "a253b074b39c1478f0e5236ca475e44d915530166db72f40f54f12519fbde47a"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1002+34cc9ea" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.2.0-dev.1002+0cd7016",
        using: :nounzip
      sha256 "8206a4815de413b607a9b10f02febeaa689b5edcc9eeb38382fe95e2ff9f0871"

      def install
        bin.install "edgedb-cli-3.2.0-dev.1002+0cd7016" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
