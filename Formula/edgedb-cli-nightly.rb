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
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+a8be23a",
        using: :nounzip
      sha256 "1a3041adcd7a743332c16995f708506f4276d64b953ff35eeb8a0f9fc051ac55"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+a8be23a" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1026+347d989",
        using: :nounzip
      sha256 "acb25bb7964ea1b47e4f7345970d2d53381dfaf9bae748a3e7ff630001de08a9"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1026+347d989" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
