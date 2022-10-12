class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.857"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.857+3ff6d22?edgedb.nightly",
        using: :nounzip
      sha256 "f8bca6dd99dd6215128b1dd7b8a107be6ca4bfdff8532f23df059d537e360078"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.857+fb44665?edgedb.nightly",
        using: :nounzip
      sha256 "d7c4ff5d60085ce532d1a33a098b4283da49e20748f04b201d6a9379cb241d07"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.857+d04e11d?edgedb.nightly",
        using: :nounzip
      sha256 "d162eca7b51a7f160d3f54af0611af7bfdbcf6c4f60d732affd8d7c1f1f493ce"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.857+fb44665?edgedb.nightly",
        using: :nounzip
      sha256 "cc0abb5d53d834a38219ce766071729ae3b6f4fbfd2c515831909b1a54401569"
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
