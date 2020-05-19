DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
base_dir="${DIR}/../provider"
patch_dir="${DIR}/../patch"

cd $base_dir || exit 1