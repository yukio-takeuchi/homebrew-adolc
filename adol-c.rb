# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AdolC < Formula
  desc ""
  homepage "https://projects.coin-or.org/ADOL-C"
  url "https://www.coin-or.org/download/source/ADOL-C/ADOL-C-2.7.2.tgz"
  sha256 "902b98e39fdc44b2eb3deaa2e5b7e5d998b7c189e074db88d068e690b65782c3"


  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--enable-ulong"
    system "make", "install" # if this fails, try separate make/make install steps

    lib.install_symlink  "../lib64/libadolc.dylib" => "libadolc.dylib"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test adol-c`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
