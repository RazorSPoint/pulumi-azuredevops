DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
base_dir="${DIR}/../provider"
patch_dir="${DIR}/../patch"

cd $base_dir || exit 1

go mod tidy || exit 1
go mod vendor || exit 1

cd vendor/github.com/microsoft/azure-devops-go-api/ || exit 1
patch --quiet -p1 -i $patch_dir/azure-devops-go-api-rune-error.patch || exit 1
