playlist_url := "https://www.youtube.com/playlist?list=PL9HYL-VRX0oSeWeMEGQt0id7adYQXebhT"
bundle_name := "dslab"
bundle_tag := "ds-lab"
out_dir := "dslab"
count := "3"

default:
    @just --list

wiki:
    ./bin/build-wiki --playlist "{{playlist_url}}" --name "{{bundle_name}}" --tag "{{bundle_tag}}" --out-dir "{{out_dir}}" --count {{count}}

wiki-full:
    ./bin/build-wiki --playlist "{{playlist_url}}" --name "{{bundle_name}}" --tag "{{bundle_tag}}" --out-dir "{{out_dir}}"

clean:
    rm -rf {{out_dir}}
