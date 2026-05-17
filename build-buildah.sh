export CONTAINER_REPO="gitea.wefers.page/julian/amd-strix-halo-toolboxes"
export LOCAL_PREFIX="llama"
export BUILD_CACHE="${CONTAINER_REPO}"
export TAG="rocm-7.2.3"

echo build rocm7.2.3

cd toolboxes

buildah bud \
    --squash \
    --format oci \
    --cache-from "${BUILD_CACHE}" \
    --cache-to "${BUILD_CACHE}" \
    -t "${CONTAINER_REPO}:${TAG}" \
    -f Dockerfile.rocm-7.2.3
echo push rocm7.2.3

buildah push \
    --compression-format zstd:chunked  \
    gitea.wefers.page/julian/amd-strix-halo-toolboxes:rocm-7.2.3
