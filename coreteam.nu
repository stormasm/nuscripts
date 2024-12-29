# create a nushell record with team members and commit hash
def get_core_team_first_commit_hashes [] {
    {
        "amtoine": "62d3497bb",
        "andrasio": "7e78bb4af",
        "ayax79": "8144926dc",
        "dd7": "4926865c4",
        "devyn": "cf68334fa",
        "elferherrera": "6dafaa197",
        "fdncred": "e9e3fac59",
        "hustcer": "1bdcdcca7",
        "IanManske": "ac30b3d10",
        "kubouch": "3d63901b3",
        "NotTheDr01ds": "87fa86c60",
        "rgwood": "cb5d997ad",
        "rose": "f4d9ddd",
        "sholderbach": "31a5de973",
        "soph": "cbb86b0ca",
        "stormasm": "5ff4bcfb7",
        "thegedge": "341cc1ea6",
        "WindSoilder": "e14e60dd2",
        "wycats": "8f3b27333",
        "ysthakur": "414216edf",
    }
}

def get_commit_info_for_core_team [] {
    let root = "https://api.github.com/repos/nushell/nushell/commits/"

    let hashes = (get_core_team_first_commit_hashes)
    $hashes | items {|k, v|
      print $'Gathering info for: ($k)'
      sleep 0.5sec # don't go too fast or gh will puke
      let their_name = $k
      let their_hash = $v
      let constructed_url = $'($root)($their_hash)'
      let gh_info = (http get $constructed_url)
      let author_name = $gh_info.commit.author.name
      let author_date = $gh_info.commit.author.date
      let commit_message = $gh_info.commit.message | lines | first
      let total = $gh_info.stats.total
      let additions = $gh_info.stats.additions
      let deletions = $gh_info.stats.deletions
      [{discord_name: $their_name, first_pr_hash: $their_hash, github_author: $author_name, commit_date: ($author_date | into datetime), message: $commit_message, first_pr_additions: $additions }]
    } | flatten | collect | sort-by commit_date
}
