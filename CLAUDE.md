# sei-swift

Swift package for [Sxnnyside Eloquent Icons (SEI)](https://github.com/sxnnyside-project/sxnnyside-eloquent-icons).

## Topology

**Monolithic.** One publishable unit: the `SEISwift` library target. There
is no `.xcodeproj`/`.xcworkspace` in this repo — `Package.swift` is the
canonical build description, and `xcodebuild -scheme SEISwift` works
directly against the SPM-generated scheme without one. Don't add a project
file "because libraries should have one" (DX-16); add it only if a concrete
technical need arises.

## Stack Profile

Swift — see the DXQE Swift Stack Profile. Concretely:

| Category | Tool |
| --- | --- |
| Package Manager | Swift Package Manager |
| Correctness | Swift 6 language mode, strict concurrency (`swiftLanguageMode(.v6)`) |
| Formatter | `swift format` (bundled with the Swift 6 toolchain), config in `.swift-format` |
| Linter | SwiftLint, config in `.swiftlint.yml` |
| Testing | XCTest, via both `swift test` and `xcodebuild test` (see below) |
| Build | SPM (`swift build`) for iteration; `xcodebuild` for anything touching the asset catalog |
| Monorepo | N/A — single package, no local SPM dependencies |
| Git Hooks | none configured |

### `typecheck` == `build`

Like Dart's `analyze`, Swift has no correctness check separate from
compilation — `swift build` (via the Swift compiler) *is* the type/strict-
concurrency check. The Justfile's `typecheck` recipe runs `swift build`
directly; that's Swift's tooling reality, not a shortcut.

### Why both `swift test` and `xcodebuild test`

`swift build`/`swift test` never invoke `actool` — Asset Catalogs
(`.xcassets`) only compile to `Assets.car` under Xcode's build system.
Verified empirically: `swift build -v | grep actool` shows nothing; the
`.xcassets` folder is copied uncompiled. This means:

- Resource-loading tests (`UIImage.sei`/`NSImage.sei` for every icon) use
  `Bundle.module.url(forResource: "Assets", withExtension: "car")` to detect
  whether they're running against a compiled catalog, and call
  `XCTSkipUnless` if not — so `swift test` stays green instead of failing
  on a known tooling gap.
- `xcodebuild test -scheme SEISwift -destination 'platform=macOS'` is the
  only command that actually exercises the compiled-asset path end to end.
  Both `just test` and `just check` run it after `swift test`, and it's
  required to pass before considering a resource-affecting change verified.
- Don't "fix" a skipped resource test by removing the skip guard — that
  just makes `swift test` red for a reason that isn't a real bug.

Architecture and file layout: see [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Public API rules

- `SEIIcons` contains every icon (outline always exists). `SEIIconsFilled`
  contains only icons that have filled artwork — deliberate, mirroring
  `flutter_sei`/`dart_sei`: it makes requesting a nonexistent filled icon a
  compile-time error via `SEIIcon.filled(_:)`, not a runtime crash.
- `SxEloIcon` is `@available(*, deprecated, renamed: "SEIIcon")` — a
  typealias, not removed. The enum rename (`SEIIcon` → `SEIIcons`) has no
  equivalent compatibility shim: the old enum name `SEIIcon` is now the
  view's name, so the two can't coexist. This is documented in
  CHANGELOG.md's 2.0.0 migration notes rather than silently breaking.
- Keep the public surface minimal — only what a consumer genuinely needs.
  Internals (asset name resolution, bundle lookup) stay private.

## Assets

`Sources/SEISwift/Resources/SEI.xcassets/` is synced manually from
`../sxnnyside-eloquent-icons/icons/`, the single source of truth. When the
icon collection changes:

1. Copy the changed/new `.svg` file(s) from
   `sxnnyside-eloquent-icons/icons/{outline,filled}/`.
2. Convert to PDF — Asset Catalog imagesets don't support raw SVG:
   `rsvg-convert -f pdf -o name.pdf name.svg`.
3. Place the PDF in a new/updated `.imageset` under `SEI.xcassets/`. Filled
   variants use the `{name}-filled.imageset` naming convention (a filled and
   an outline icon share a base name, so the suffix avoids a catalog
   collision).
4. Add the case to `SEIIcons.swift` (and `SEIIconsFilled.swift` if filled),
   alphabetically within its MARK category.
5. Run `just check`.

## Release process

Unlike `flutter_sei`/`dart_sei`, Swift Package Manager has no package
registry — consumers resolve a dependency directly from a git tag
(`.package(url: "...", from: "2.0.0")`). "Publishing" a Swift package is
just pushing the tag; there's no pub.dev-style trusted-publishing setup to
configure.

- `.github/workflows/ci.yml` runs the full `just check` gate (minus the
  release step) on every push to `main` and every PR.
- `.github/workflows/release.yml` triggers on a `vX.Y.Z` tag: re-runs the
  full quality gate against the tagged commit, then creates a GitHub
  Release from the matching `CHANGELOG.md` section.
- Bump `CHANGELOG.md` under a new version heading, then
  `git tag vX.Y.Z && git push --tags`.

## Review criteria

- `just check` must pass before merge.
- New/changed public API needs a CHANGELOG.md entry and doc comments.
- Icon additions/removals must keep `SEIIcons`/`SEIIconsFilled` in sync with
  `SEI.xcassets` — a mismatch fails at test time (`xcodebuild test`), not at
  build time.
- Resource-affecting changes must be verified via `xcodebuild test`, not
  just `swift test` (see "Why both `swift test` and `xcodebuild test`").
