class WithThis < Formula
    desc "With let's you run any shell command with variables, in parallel."
    homepage "https://github.com/amritb/with-this"
    url "https://github.com/amritb/with-this/archive/v0.1-alpha.0.tar.gz"
    sha256 "ac8976a592e6832b8f0ad908bee27f1ac9870efad759681df3185050cda5c648"
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
      assert_match "with version v0.1-alpha.0", shell_output("#{bin}/with --version 2>&1", 2)
    end
  end
  