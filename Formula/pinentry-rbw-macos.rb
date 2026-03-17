class PinentryRbwMacos < Formula
  desc "macOS pinentry for rbw with Touch ID or Apple Watch authentication"
  homepage "https://github.com/pppobear/pinentry-rbw-macos"
  url "https://github.com/pppobear/pinentry-rbw-macos/archive/f1fdfd31ba960a5431fc96a331f1c00dabd5dcf0.tar.gz"
  version "0.1.0"
  sha256 "f603828d68456f1c49b1a89a31cf53252749d5096570c601f1be6b7c5ec5b521"
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
