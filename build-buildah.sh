export CONTAINER_REPO="gitea.wefers.page/julian/amd-strix-halo-toolboxes"
export BUILD_CACHE="gitea.wefers.page/julian/amd-strix-halo-toolboxes-buildcache"
export LOCAL_PREFIX="llama"
export BUILD_CACHE="${CONTAINER_REPO}"
export TAG="rocm-7.2.3"

echo build rocm7.2.3

cd toolboxes

buildah bud \
    --pull \
    --squash \
    --format oci \
    --layers \
    --no-cache \
    --cache-from "${BUILD_CACHE}" \
    --cache-to "${BUILD_CACHE}" \
    -t "${CONTAINER_REPO}:${TAG}" \
    -f Dockerfile.rocm-7.2.3

if [ $? -eq 0 ]; then
    echo push rocm7.2.3
    buildah push \
        --compression-format zstd:chunked  \
        "${CONTAINER_REPO}:${TAG}"
fi
