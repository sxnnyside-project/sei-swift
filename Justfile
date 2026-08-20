# SEISwift — Task Runner Abstraction Layer (DXQE Part 3)
#
# `swift build` compiles source but never invokes `actool` — Asset Catalogs
# only compile under Xcode's build system. `test` and `check` therefore run
# both `swift test` (fast, CLI-only correctness) and `xcodebuild test`
# (slower, but the only path that exercises real resource loading). See
# CLAUDE.md for the full rationale.

install:
    swift package resolve

dev:
    open Package.swift

build:
    swift build

build-xcode:
    xcodebuild build -scheme SEISwift -destination 'platform=macOS'

test:
    swift test
    xcodebuild test -scheme SEISwift -destination 'platform=macOS'

typecheck:
    swift build

lint:
    swiftlint lint --strict

format:
    swift format format -i -r Sources Tests

format-check:
    swift format lint -r Sources Tests

check: format-check lint typecheck test

clean:
    rm -rf .build
    xcodebuild clean -scheme SEISwift -destination 'platform=macOS' 2>/dev/null || true
