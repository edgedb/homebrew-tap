class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.1.0-dev.842"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.842+3587aaa?edgedb.nightly",
        using: :nounzip
      sha256 "c3b16e50564a0a104cb746c7c70e8da8528e36dc31564ac57ab4cdd279c220ed"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-2.1.0-dev.842+0ba9f97?edgedb.nightly",
        using: :nounzip
      sha256 "3f54eb4ea7f1755660925628f491f09425a74e4b29719aa204bd5fd465c54a79"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.842+127b319?edgedb.nightly",
        using: :nounzip
      sha256 "26f7667f59efc01a8148ac0ea01431f034dd87dfd9db1a9bdc6ccebf7ffab469"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-2.1.0-dev.842+15ebee8?edgedb.nightly",
        using: :nounzip
      sha256 "6c4792081ee76e36c290361fd280fcaa88b0feafef9e51b7b98ec27899b8dd91"
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
