require 'formula'

class TmePortalCollector < Formula
  head 'https://github.com/trendmicro/tme.git', :branch => 'osx-lion'
  homepage 'http://trendmicro.github.com/tme/'
# md5 '1234567890ABCDEF1234567890ABCDEF'

# depends_on 'cmake'
# depends_on 'rvm'
  depends_on 'tme-common'

  def install
    # Create library folder first to force linking JAR files.
    mkdir_p "#{HOMEBREW_PREFIX}/lib/tme"

    system "make", "--directory=src/portal-collector", "BUILD_PREFIX=#{prefix}", "INSTALLPATH=", "CONFPATH=etc/tme", "LIBPATH=lib/tme", "install"

    # No need to have init.d scripts.
    remove_dir "#{prefix}/etc/init.d"
  end
end




