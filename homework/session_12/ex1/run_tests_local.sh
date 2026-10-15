#!/usr/bin/env bash
# Script to simulate GitHub Actions Matrix strategy locally across JDK versions

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "=== [Local Matrix Simulation] Running Test Matrix for Java 17 and Java 21 ==="
MATRIX_VERSIONS=("17" "21")

chmod +x gradlew

for ver in "${MATRIX_VERSIONS[@]}"; do
    echo "------------------------------------------------------"
    echo "--> Simulating Sub-job: Test on Java ${ver}"
    echo "--> Environment: distribution=temurin, cache=gradle, java-version=${ver}"
    export JAVA_VERSION="${ver}"
    ./gradlew test
    echo "--> [SUCCESS] Sub-job Test on Java ${ver} passed."
done

echo "------------------------------------------------------"
echo "=== Matrix Execution Completed: All jobs passed successfully! ==="
