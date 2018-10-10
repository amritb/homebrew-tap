class WithThis < Formula
    desc "With let's you run any shell command with variables, in parallel."
    homepage "https://github.com/amritb/with-this"
    url "https://github.com/amritb/with-this/archive/v0.1-beta.1.tar.gz"
    sha256 "de1a31b7824d6fa8660510ffa3cb8b490ce8b7e99f3984c4b3e2c23f969a71e0"
    depends_on "go" => :build
  
    def install
      ENV["GOPATH"] = buildpath
      bin_path = buildpath/"src/github.com/amritb/with-this"
      bin_path.install Dir["*"]
      cd bin_path do
        system "go", "build", "-o", bin/"with", "."
      end
    end
  
    test do
      assert_match "with version v0.1-beta.1", shell_output("#{bin}/with --version 2>&1", 2)
    end
  end
  
