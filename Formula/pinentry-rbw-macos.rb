class PinentryRbwMacos < Formula
  desc "macOS pinentry for rbw with Touch ID or Apple Watch authentication"
  homepage "https://github.com/pppobear/pinentry-rbw-macos"
  url "https://github.com/pppobear/pinentry-rbw-macos/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "4c3611e04c8864e34f9ed191ff2944585f4e350752acf94a8a5af2f675fd5751"
  head "https://github.com/pppobear/pinentry-rbw-macos.git", branch: "main"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/pinentry-rbw-macos"
  end

  test do
    assert_match "pinentry-rbw-macos", shell_output("#{bin}/pinentry-rbw-macos --help")
  end
end
