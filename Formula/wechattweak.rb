class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v270098/wechattweak-v270098-macos-universal.tar.gz"
  sha256 "2e3048bc0a3c1f8ab4d01d03ab156ca818ef856ddbc465c70fc6e79221d93714"
  license "AGPL-3.0"
  version "270098"
  # 微信版本号没变、只换包内容，必须递增 revision 才会让已装用户 brew upgrade。
  # revision 2：修复重签 bug（--deep --entitlements 会把主 app 的 entitlements
  # 盖到所有嵌套 helper 上，导致 WeChatAppEx 等沙盒初始化 SIGILL、小程序打不开）。
  revision 2

  def install
    bin.install "wechattweak"
    # 撤回提示运行时组件（wechattweak patch --tip 需要）。
    # 装到 libexec；wechattweak 会沿 Cellar 定位到 <keg>/libexec。
    libexec.install "libwxrevoketip.dylib", "add_load_dylib.py"
  end

  test do
    assert_match "A command-line tool for tweaking WeChat", shell_output("#{bin}/wechattweak --help")
  end
end
