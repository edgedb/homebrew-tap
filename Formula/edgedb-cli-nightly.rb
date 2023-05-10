class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.980"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.980+d9789a4",
        using: :nounzip
      sha256 "8b33ac005764dee8dfe0e2a9309c79a2d65c961b7e4ba054a3059e678817d671"

      def install
        bin.install "edgedb-cli-3.0.0-dev.980+d9789a4" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.980+ab14b99",
        using: :nounzip
      sha256 "0a36ae4681b5e4d116e6bfb35d85d4fa850ed4a43488cf5395327d769a06f350"

      def install
        bin.install "edgedb-cli-3.0.0-dev.980+ab14b99" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.980+423267e",
        using: :nounzip
      sha256 "dea50dda4c687a0c8ccd1f3b2126816fe9b8e2b8567088e477a70d3fadc3691a"

      def install
        bin.install "edgedb-cli-3.0.0-dev.980+423267e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.980+968ca50",
        using: :nounzip
      sha256 "f805aeec1b29a1a1c29a0532caed7c3cb9879c3b50eaf6ca5e6905f2f98731ec"

      def install
        bin.install "edgedb-cli-3.0.0-dev.980+968ca50" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
