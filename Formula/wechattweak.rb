class Wechattweak < Formula
  desc "A command-line tool for tweaking WeChat"
  homepage "https://github.com/tanranv5/WeChatTweak"
  url "https://github.com/tanranv5/WeChatTweak/releases/download/v270098/wechattweak-v270098-macos-universal.tar.gz"
  sha256 "33cd499eb84a480dda0b66d988287d763d89a4070fe249a36250c93def7a6ced"
  license "AGPL-3.0"
  version "270098"
  # 微信版本号没变、只换包内容，必须递增 revision 才会让已装用户 brew upgrade。
  # revision 2：修复重签 bug（--deep --entitlements 写坏嵌套 helper → 小程序打不开）。
  # revision 3：屏蔽自动更新改为**默认开启**，新增 --no-block-update 显式关闭并撤销已打的屏蔽。
  revision 3

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
