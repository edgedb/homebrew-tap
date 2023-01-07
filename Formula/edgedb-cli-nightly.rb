class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.3.0-dev.902"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.902+04d64ff?edgedb.nightly",
        using: :nounzip
      sha256 "4d457a545ea2ac189e1d7c7ebe9cda31d8706637225da083aa53704f9b8690c2"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.3.0-dev.902+1bc02ec?edgedb.nightly",
        using: :nounzip
      sha256 "fd4024c8deeb18823ddeb9a61a6ba71672672738a10326ce14061065b7d9dd2a"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.902+0aaacfb?edgedb.nightly",
        using: :nounzip
      sha256 "5f0e8957a6c7ec72b92ed0bcd39760bdf6a7636c0d78be0569b0ec0f945d35af"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.3.0-dev.902+17ef471?edgedb.nightly",
        using: :nounzip
      sha256 "dfa30fb96b02139d8d7dcb4b92fac41d675697d793862fcb9c2d75da2c88e9bb"
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
