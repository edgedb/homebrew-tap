class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.922"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.922+d8320e6?edgedb.nightly",
        using: :nounzip
      sha256 "b2923409e306cdc59916579832e2cff350c5c6343eac2116fdfc1a7fbf9c0e0e"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.922+5dccb7c?edgedb.nightly",
        using: :nounzip
      sha256 "3b030068274d39363f585b78db245ce2920c90938537061ed62772ac3cd72544"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.922+9cd4e00?edgedb.nightly",
        using: :nounzip
      sha256 "8219043309a3bd7f280a004ec613f708c3953a292c96d4589ba4ce44fee42433"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.922+7d960a5?edgedb.nightly",
        using: :nounzip
      sha256 "1b9081d6a3fb46d43eaebf30b768d4f97c735224c7ff2fd46f866a8266be45f9"
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
