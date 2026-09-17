class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v270098/wechattweak-v270098-macos-universal.tar.gz"
  sha256 "7aff6201bb07f2c9be75f461ab86e604a6ab6d9626d59d65deb9e544c6846f47"
  license "AGPL-3.0"
  version "270098"

  def install
    bin.install "wechattweak"
  end

  test do
    assert_match "A command-line tool for tweaking WeChat", shell_output("#{bin}/wechattweak --help")
  end
end
