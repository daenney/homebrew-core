class Spigot < Formula
  desc "Command-line streaming exact real calculator"
  homepage "http://www.chiark.greenend.org.uk/~sgtatham/spigot/"
  url "http://www.chiark.greenend.org.uk/~sgtatham/spigot/spigot-20170219.02cd6ee.tar.gz"
  sha256 "c14f220de17c02b3b67f428b5d92618f1a0167bcbad890201de3a114a076aabb"

  bottle do
    cellar :any_skip_relocation
    sha256 "1d2b314268104da5860c5a9bee9bdc432a1b51a0ca65054d6db245d2b631ddb0" => :sierra
    sha256 "36174128a0c9666b2401bc8818bb662a1a91914ff8bee9c0f3e017cf5287aec9" => :el_capitan
    sha256 "85ded0973a21995681f45284887d5146ae7982e955c2353d0e8d2297751b38c0" => :yosemite
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # Get Ramanujan's number of decimal places of Tau in base10
    assert_equal shell_output("#{bin}/spigot -d1729 tau").strip, "6.2831853071795864769252867665590057683943387987502116419498891846156328125724179972560696506842341359642961730265646132941876892191011644634507188162569622349005682054038770422111192892458979098607639288576219513318668922569512964675735663305424038182912971338469206972209086532964267872145204982825474491740132126311763497630418419256585081834307287357851807200226610610976409330427682939038830232188661145407315191839061843722347638652235862102370961489247599254991347037715054497824558763660238982596673467248813132861720427898927904494743814043597218874055410784343525863535047693496369353388102640011362542905271216555715426855155792183472743574429368818024499068602930991707421015845593785178470840399122242580439217280688363196272595495426199210374144226999999967459560999021194634656321926371900489189106938166052850446165066893700705238623763420200062756775057731750664167628412343553382946071965069808575109374623191257277647075751875039155637155610643424536132260038557532223918184328403978761905144021309717265577318723067636559364606039040706037059379915472451988277824994435505669582630311497144849083013919016590662337234557117781501967635092749298786385101208018554033422780196976480257167232071274153202094203638859111923978935356748988965107595494536942080950692924160933685181389825866273540579783042095043241139320481160763003870225067648600711752804949929465278283985452085398455935647095632720186834432824398491726300605723659491114134996770109891771738539913818544215950186059106423306899744055119204729613309982397636695955071327396148530850557251036368351493457819555455876001632941200322904983843464344295447002828839471370963227223147051042669514836989368770466478147882866690955248337250379671389711241"
  end
end