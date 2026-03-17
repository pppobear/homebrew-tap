class PinentryRbwMacos < Formula
  desc "macOS pinentry for rbw with Touch ID or Apple Watch authentication"
  homepage "https://github.com/pppobear/pinentry-rbw-macos"
  url "https://github.com/pppobear/pinentry-rbw-macos/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "ab3af063fe4e8b695bdf91b9c4460bd34d6967139dfdbb0d46f9349dff207c7b"
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
