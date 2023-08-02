class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1025"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+206d54f",
        using: :nounzip
      sha256 "b759884e5da685936ce2e5908a638765e36d47e286b333cd6bbe7c312c31c0d6"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+206d54f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+05cc3da",
        using: :nounzip
      sha256 "0d98aef388d233681525d5d057d9685e74d6bf4d5c23e322c451579d8c84cb17"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+05cc3da" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+13a08fc",
        using: :nounzip
      sha256 "d1e7b22059b31a110285667a551bf75be6ff09c5759c6c852b94418646bb93eb"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+13a08fc" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+0201e32",
        using: :nounzip
      sha256 "a3310d51e2bc3f8e4cb346fb73a4dcf5b7a789dac2334731d9901899e839737f"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+0201e32" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
