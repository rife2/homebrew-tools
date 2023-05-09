class Bld < Formula
  desc "Open-source build tool for the RIFE2 Java web framework"
  homepage "https://rife2.com"
  url "https://repo.rife2.com/releases/com/uwyn/rife2/rife2/1.6.3/rife2-1.6.3-bld.zip"
  sha256 "807af474738a176cfeb6d7883c3ff25ffda65a0b2741de6c6707a5852bb90459"
  license "Apache-2.0"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env("17")
    (bin/"bld").write_env_script libexec/"bin/bld", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bld help")
  end
end
