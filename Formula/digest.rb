class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/AnudeepChPaul/digest"
  url "https://github.com/AnudeepChPaul/digest/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "619b9396cd82bf74d8bde26bdbb07263fd7ad213fdabd0e34f38f85e60f21c16"
  license "MIT"
  head "https://github.com/AnudeepChPaul/digest.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos
  depends_on "terminal-notifier"

  def install
    ldflags = "-X github.com/AnudeepChPaul/digest/pkg/tui.appVersion=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/digest"
  end

  test do
    assert_match "install", shell_output("#{bin}/digest --help 2>&1")
  end
end
