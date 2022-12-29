require 'formula'

class Olam < Formula
  desc 'English Malayalam Dictionary'
  homepage 'http://github.com/tachyons/olam'
  head 'https://github.com/tachyons/olam.git'

#   depends_on 'qmake' => :build
  depends_on 'qt@5'

  def install
    system 'qmake'
    system 'make'
    prefix.install 'build/release/olam.app'
    (bin / 'olam').write("#! /bin/sh\n#{prefix}/olam.app/Contents/MacOS/olam \"$@\"\n")
  end

  test do
    system 'olam', '-h'
  end
end
