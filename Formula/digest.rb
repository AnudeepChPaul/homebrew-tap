class Digest < Formula
  desc "Terminal dashboard for your day-to-day work"
  homepage "https://github.com/AnudeepChPaul/digest"
  url "git@github.com:AnudeepChPaul/digest.git",
      using:    :git,
      tag:      "v1.1.50",
      revision: "2427f7c3084f4f390946ea9a75e6a408240dbe93"
  head "git@github.com:AnudeepChPaul/digest.git", branch: "main", using: :git

  depends_on "go" => :build
  depends_on :macos
  depends_on "terminal-notifier"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X app/pkg/tui.appVersion=#{version}"), "./cmd/app"
  end

  test do
    assert_match "install", shell_output("#{bin}/digest --help 2>&1")
  end
end
