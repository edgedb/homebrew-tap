class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.851"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.851+bcb7d69?edgedb.nightly",
        using: :nounzip
      sha256 "2b74aa6801e63df589dd3189cf2e63151dabf64e94f7d0311a769c984e738203"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.851+3f4dbf3?edgedb.nightly",
        using: :nounzip
      sha256 "d0208c617928c57554bd264037673a9eb4faf08976fa7ff47fe5aff1e8ffe9aa"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.851+1ad8ec3?edgedb.nightly",
        using: :nounzip
      sha256 "574064f31d62f755ba823ffd59ebeb1e36f9d798094bdfbcfb8afb635e7ff361"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.851+c6488ce?edgedb.nightly",
        using: :nounzip
      sha256 "e855cdb49cbc4917c40050bbe77848ebaf6974b1a3e74a42ca23a67e864a0a56"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.nightly" => "edgedb-nightly"
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
