class EdgedbCli < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "2.2.6"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin/edgedb-cli-2.2.6+7eabbf9?edgedb.release",
        using: :nounzip
      sha256 "75a92bbc3fc860b6b9a23d487cf5d569bcd734b6446c8591af8ce962b22d441c"
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin/edgedb-cli-2.2.6+7eabbf9?edgedb.release",
        using: :nounzip
      sha256 "578f31bc3d811fddc525fe4746b44387d364dd42e4ecb41a958fcc788cd4da10"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl/edgedb-cli-2.2.6+c238569?edgedb.release",
        using: :nounzip
      sha256 "c6b5aac357b44460566429423c1460c82062808d7c2b147983aeb00129ad772c"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl/edgedb-cli-2.2.6+b869667?edgedb.release",
        using: :nounzip
      sha256 "1c7ec9ddffa1e4e923dc9d7cced949a781f62cdfed2aba18a12cebf8387120bc"
    else
      odie "Unsupported CPU architecture!"
    end
  end

  def install
    bin.install "edgedb.release" => "edgedb"
  end

  test do
    system "#{bin}/edgedb", "--version"
  end
end
