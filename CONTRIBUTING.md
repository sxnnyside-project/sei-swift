# Contributing to SEISwift

Thank you for your interest in contributing to **SEISwift**, the Swift/SwiftUI
layer for Sxnnyside Eloquent Icons (SEI).

This document explains how to contribute without friction.

---

## Before You Start

Please read the following documents first:

* `README.md`
* `CLAUDE.md` — architecture, topology, and API rules
* `CODE_OF_CONDUCT.md`

If your idea conflicts with any of these, it is unlikely to be accepted.

---

## Scope

This repository wraps SEI icons in a Swift package for SwiftUI, UIKit, and
AppKit. It does not design or maintain the icons themselves.

* **Want a new icon design or concept?** Open that request on the
  [SEI icons repository](https://github.com/sxnnyside-project/sxnnyside-eloquent-icons/issues)
  instead — it's out of scope here.
* **Want a new icon already in SEI exposed through this package?** That's
  in scope — see "Icon Sync" below.
* **Want a Swift/SwiftUI API change** (new initializer, a fix, better
  ergonomics)? In scope — see "Code Contributions" below.

---

## What You Can Contribute

### Icon Sync

If an icon exists in [SEI](https://github.com/sxnnyside-project/sxnnyside-eloquent-icons)
but not yet in this package:

1. **Design the icon** — export as clean, optimized SVG (see icon guidelines
   in the SEI icons repository).
2. **Convert to PDF**: Asset Catalog imagesets don't support raw SVG —
   convert with `rsvg-convert -f pdf -o name.pdf name.svg` before adding it.
3. **Add to Resources**: place the PDF in a new `.imageset` under
   `Sources/SEISwift/Resources/SEI.xcassets/`. Filled variants use the
   `{name}-filled.imageset` naming convention.
4. **Update the enum**: add the case to `SEIIcons.swift` (and
   `SEIIconsFilled.swift` if a filled asset was added), keeping alphabetical
   order within each MARK category.
5. **Verify loading**: run `just check` — this exercises both `swift test`
   and `xcodebuild test`, since only the latter compiles the asset catalog.
6. **Update documentation**: add the icon to README.md's category list.

### Code Contributions

You may contribute:

* Bug fixes.
* API ergonomics improvements that don't break existing usage without
  justification (see `CLAUDE.md`'s public API rules).
* Documentation improvements.
* Test coverage for existing behavior.

Each change should:

* Pass `just check` (format, lint, typecheck, test).
* Include a `CHANGELOG.md` entry.
* Include doc comments for any new or changed public API.

---

## What Is Not Accepted

* New icon *designs* — submit those to the SEI icons repository.
* Unreviewed AI-generated code that doesn't meet the project's quality bar
  (see `CODE_OF_CONDUCT.md`).
* Breaking API changes without a documented rationale in the PR description
  and a corresponding `CHANGELOG.md` entry.
* Large, unsolicited refactors that aren't discussed in an issue first.

---

## Contribution Process

1. Open an issue describing your idea or request.
2. Wait for confirmation or discussion.
3. Submit a focused pull request.
4. Be open to feedback and iteration.

Maintainers may request changes or close pull requests that do not align
with the project.

---

## Commit Style

This project uses [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/). Every commit message follows:

```
<type>: <description>

[optional body]
[optional footer]
```

| Type       | Use for                                   |
|------------|--------------------------------------------|
| `feat`     | New API surface or a newly synced icon    |
| `fix`      | Bug fixes                                 |
| `docs`     | Documentation only                        |
| `style`    | Formatting, whitespace — no logic changes |
| `refactor` | Code restructure without behavior change  |
| `test`     | Adding or updating tests                  |
| `chore`    | Build process, tooling, dependencies      |
| `perf`     | Performance improvements                  |

Examples:

```
feat: add SEIIcons.rotate
fix: correct rendering mode for filled icons
chore: bump swiftlint to 0.65.0
```

---

## Questions

If something in the codebase is unclear, open an issue with the `question`
label before assuming it's a bug.

---

*SEISwift is part of the [Sxnnyside Project](https://sxnnysideproject.com).*
