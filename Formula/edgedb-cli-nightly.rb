class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.884"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.884+2c48200?edgedb.nightly",
        using: :nounzip
      sha256 "a2f7cd65d1f87214c28feaead403d82b71fb0881269037986047e7e3d884a251"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.884+fba182d?edgedb.nightly",
        using: :nounzip
      sha256 "714c3ec191c390f182df1c6683cb2b866764e5c415ab4fdbe75c24bd93e23440"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.884+3596104?edgedb.nightly",
        using: :nounzip
      sha256 "126662a4774fcb77940db2368a629ff0a3452970d3ed72c9eb6815ba14948b90"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.884+1a68be8?edgedb.nightly",
        using: :nounzip
      sha256 "6932ba24aa70d10d250d5213576ccddcf03ee396893271f58f8da2e39712f905"
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
