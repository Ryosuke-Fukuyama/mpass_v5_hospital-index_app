#!/bin/bash
set -e

# Rails用に存在する可能性のあるserver.pidを削除する。
rm -f /mpass_index_app/tmp/pids/server.pid

# DockerfileのCMDで設定されているものを実行する。
exec "$@"