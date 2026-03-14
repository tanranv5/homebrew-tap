class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v36559.2/wechattweak-v36559.2-macos-universal.tar.gz"
  sha256 "f95637ebab51039cd5cff138b9b239c4fb3a4902298608d658eaa12d2d48c3e0"
  license "AGPL-3.0"
  version "36559.2"

  def install
    bin.install "wechattweak"
  end

  test do
    assert_match "A command-line tool for tweaking WeChat", shell_output("#{bin}/wechattweak --help")
  end
end
