class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.0.0-dev.960"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.960+40d95df?edgedb.nightly",
        using: :nounzip
      sha256 "9c262e35af909906b8d724e3329585e283ba4a5ca680ad6ddf328dc5dfac9a56"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.0.0-dev.960+213ae8a?edgedb.nightly",
        using: :nounzip
      sha256 "bf58c6a7f07f9b85ea0ffc73a5d04a405209befe8f4c03f1b045e5407ca9957c"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.960+098b63a?edgedb.nightly",
        using: :nounzip
      sha256 "744c38e1614c5e3641a813ee57b9cd60070d1fee9b202a2b9884b20076de43d9"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.0.0-dev.960+044a935?edgedb.nightly",
        using: :nounzip
      sha256 "a7e70709d1cc33410a7f345175bc8a959bd55fc9c8237f09e433b00ce151e4ba"
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
