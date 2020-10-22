set -e


ARTIFACT_NAME=$1
OUTPUT_PATH=$2

BINARY=bazel-deps


GENERATED_SHA_256=$(shasum -a 256 $BINARY | awk '{print $1}')


mkdir $OUTPUT_PATH

mv $BINARY $OUTPUT_PATH/${ARTIFACT_NAME}
echo $GENERATED_SHA_256 > $OUTPUT_PATH/${ARTIFACT_NAME}.sha256

echo $(shasum -a 256 bazel-deps.jar | awk '{print $1}') > $OUTPUT_PATH/bazel-deps.jar.sha256
mv bazel-deps.jar  $OUTPUT_PATH/
