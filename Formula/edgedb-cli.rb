class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "6.0.1"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-6.0.1+354ed68",
        using: :nounzip
      sha256 "905e52032e936e554000988536f67e33fcc1a54d5570178c79d5f9bc750a8d83"

      def install
        bin.install "edgedb-cli-6.0.1+354ed68" => "edgedb"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-6.0.1+354ed68",
        using: :nounzip
      sha256 "b1dc23e0634432a5407710398a9c8081282b9674c6a4b91c2512c91d0360bffc"

      def install
        bin.install "edgedb-cli-6.0.1+354ed68" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-6.0.1+08ca483",
        using: :nounzip
      sha256 "f47c3ff79768b1a57849faa4e5c76bc3cf00facd623d5d8618e7a0967d0075bd"

      def install
        bin.install "edgedb-cli-6.0.1+08ca483" => "edgedb"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-6.0.1+4170384",
        using: :nounzip
      sha256 "0e37723fc59d834fbe45e5273efade510f10cd5fd74a92e34d08cd79b1b94165"

      def install
        bin.install "edgedb-cli-6.0.1+4170384" => "edgedb"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
