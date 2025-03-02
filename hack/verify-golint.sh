#!/bin/bash

# Copyright 2018 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -euo pipefail

if ! which golangci-lint > /dev/null; then
    echo "Cannot find golangci-lint. Installing golangci-lint..."
    GO111MODULE=on go get -v github.com/golangci/golangci-lint/cmd/golangci-lint@v1.41.1
fi

$GOPATH/bin/golangci-lint run --deadline=10m

echo "Congratulations! All Go source files have been linted."
