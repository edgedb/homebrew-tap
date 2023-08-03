class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1026"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+9eb6150",
        using: :nounzip
      sha256 "4b5f4b7a48133c7bf0c68c710207feccbb4f3db95ed4df38604342be92e9a122"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+9eb6150" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1026+ae98573",
        using: :nounzip
      sha256 "0a7060fabdc3c3e00cf7ac0e7e646551f4c8596d1b7c08555761e13267059fbf"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+ae98573" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+df95533",
        using: :nounzip
      sha256 "841dcb4d2f51194ba90013d91edb548eee36a239bab6482480078e693a66690b"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+df95533" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+fa2fd63",
        using: :nounzip
      sha256 "2ebbd61b2325edbbe507b8e40c978b7aa7249d676f9a731e4742c70b88459e54"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+fa2fd63" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
