class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.4.0-dev.1022"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1022+a27f60f",
        using: :nounzip
      sha256 "e0bdf6f054f7e48694631e2bac9d23f1d006a46b5ba6cfd92965cb28162d6549"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1022+a27f60f" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.4.0-dev.1022+4dc9674",
        using: :nounzip
      sha256 "dd460f3dd19a8a3da32fc3edfe3aeb612f2ac6670e83faac18c802b281100514"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1022+4dc9674" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1022+a8efa7e",
        using: :nounzip
      sha256 "c7dc3cae24151197318677d42167818c228e29b2c63cefe24daf31837336bc8a"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1022+a8efa7e" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.4.0-dev.1022+b7c988c",
        using: :nounzip
      sha256 "6ecd9eff71716cebb6ffd16f7dc999bbaed21a7cf2b3533a85e661a25f7b5419"

      def install
        bin.install "edgedb-cli-3.4.0-dev.1022+b7c988c" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
