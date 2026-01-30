# Contributing to SEISwift

Thank you for your interest in contributing to SEISwift! This document provides guidelines for contributing to the Sxnnyside Eloquent Icons Swift package.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Proposing New Icons](#proposing-new-icons)
- [Icon Design Guidelines](#icon-design-guidelines)
- [Naming Conventions](#naming-conventions)
- [Outline vs Filled Variants](#outline-vs-filled-variants)
- [What We Accept](#what-we-accept)
- [What We Do Not Accept](#what-we-do-not-accept)
- [Development Workflow](#development-workflow)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project adheres to the Contributor Covenant Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior to legal@sxnnyside.com.

## How to Contribute

Contributions to SEISwift are welcome in the following forms:

- **Bug reports**: Report issues with icon loading, API behavior, or documentation
- **Icon proposals**: Suggest new icons that fit the design system
- **Documentation improvements**: Fix typos, clarify examples, or add use cases
- **Code improvements**: Optimize performance, fix bugs, or improve API ergonomics

## Proposing New Icons

Before proposing a new icon:

1. **Check existing icons**: Review the [complete icon list](Sources/SEISwift/SEIIcon.swift) to ensure the icon doesn't already exist
2. **Verify use case**: Ensure the icon serves a common, reusable purpose
3. **Consider alternatives**: Check if an existing icon can be reused or renamed

### Icon Proposal Process

To propose a new icon:

1. Open a GitHub Issue using the "Icon Proposal" template
2. Provide the following information:
   - **Icon name**: Proposed enum case name (e.g., `camera`, `microphone`)
   - **Category**: Which category the icon belongs to (e.g., Media, Development)
   - **Use case**: Describe when and why this icon would be used
   - **Visual description**: Describe what the icon should depict
   - **Variants needed**: Specify if both outline and filled versions are required

3. Wait for maintainer review and approval before creating assets

## Icon Design Guidelines

All icons in SEISwift must adhere to these design standards:

### Visual Style
- **Format**: SVG vector format
- **Canvas size**: 24×24px viewBox
- **Stroke width**: 1.5px for outline variants
- **Grid alignment**: Align to pixel grid for crisp rendering
- **Visual weight**: Consistent optical weight across all icons
- **Style**: Minimalist, modern, and consistent with existing icons

### Technical Requirements
- **Clean paths**: No unnecessary nodes or overlapping paths
- **Single color**: Icons must be monochrome (fill or stroke only)
- **Optimized**: Run through SVGO or similar optimizer
- **Accessibility**: Clear and recognizable at small sizes (16px)

### Design Principles
- **Clarity**: Immediately recognizable at all sizes
- **Simplicity**: Minimal detail, avoid ornamentation
- **Consistency**: Match the visual language of existing icons
- **Universality**: Culturally neutral and widely understood

## Naming Conventions

Icon names must follow these rules:

### Case Names
- Use `camelCase` for enum cases
- Start with lowercase letter
- Use descriptive, common names
- Avoid abbreviations unless widely recognized

### Examples
✅ **Good**:
- `home`
- `settings`
- `notification`
- `lockOpen`
- `chartBar`
- `creditCard`

❌ **Bad**:
- `Home` (incorrect case)
- `settingsIcon` (redundant suffix)
- `notif` (unclear abbreviation)
- `lock_open` (use camelCase, not snake_case)
- `chartBarGraph` (redundant)
- `cc` (unclear abbreviation)

### Multi-word Names
For compound names:
- Use camelCase: `layoutGrid`, `linkExternal`, `chartLine`
- The raw value uses kebab-case: `"layout-grid"`, `"link-external"`, `"chart-line"`

### Category Alignment
Icon names should align with their category:
- **Actions**: Use verbs when appropriate (`add`, `remove`, `edit`)
- **Objects**: Use nouns (`home`, `file`, `folder`)
- **States**: Be descriptive (`success`, `error`, `warning`)

## Outline vs Filled Variants

SEISwift currently uses **outline style** as the default rendering mode.

### Current Implementation
- All icons are outline style by default
- Filled appearance is achieved through `renderingMode(.template)` with tint colors
- No separate filled assets are required at this time

### Future Considerations
If filled variants are added in the future:
- Naming convention: `iconName` (outline), `iconNameFilled` (filled)
- Both variants must be visually consistent
- Filled icons should have solid fills, not outlined strokes
- Example: `.heart` (outline) and `.heartFilled` (filled)

### What to Expect
For now, contributors should only provide **outline style** icons. Filled variants are not part of the current design system.

## What We Accept

We accept contributions that:

✅ **Icons**
- Fit within existing categories
- Serve common, reusable purposes
- Match the design guidelines
- Include clean, optimized SVG assets

✅ **Code**
- Fix bugs or crashes
- Improve performance
- Enhance API ergonomics (while maintaining compatibility)
- Add meaningful tests

✅ **Documentation**
- Fix typos or unclear wording
- Add practical examples
- Improve API reference docs
- Translate documentation (with maintainer approval)

✅ **Bug Reports**
- Include clear reproduction steps
- Specify platform and version
- Provide minimal test case

## What We Do Not Accept

We do **not** accept:

❌ **Duplicate Icons**
- Icons that are visually identical to existing ones
- Icons that can be achieved by rotating/flipping existing icons

❌ **Brand-Specific Icons**
- Company logos (Apple, Google, Microsoft, etc.)
- Social media logos (Twitter, Facebook, LinkedIn, etc.)
- Product-specific icons (iOS-only, Android-only)

❌ **Overly Specific Icons**
- Icons for niche use cases
- Icons that only apply to one app or domain
- Icons with hard-coded text or numbers

❌ **Style Inconsistencies**
- Icons that don't match the visual style
- Colored or multi-tone icons
- 3D or skeuomorphic designs
- Overly detailed or complex icons

❌ **Low-Quality Assets**
- Rasterized (PNG, JPG) icons
- Unoptimized SVGs with bloated code
- Icons with embedded raster images
- Icons with unnecessary groups or layers

❌ **Breaking Changes**
- Changes that break existing API
- Renaming existing icons without deprecation
- Removing icons without major version bump
- Changes to asset loading behavior

## Development Workflow

### Setting Up

1. **Fork the repository**:
   ```bash
   git clone https://github.com/HoujouSxnnyside/sei_swift.git
   cd sei_swift
   ```

2. **Open in Xcode**:
   ```bash
   open Package.swift
   ```

3. **Build the package**:
   ```bash
   swift build
   ```

4. **Run tests**:
   ```bash
   swift test
   ```

### Adding a New Icon

1. **Design the icon** following the guidelines above
2. **Export as SVG** with clean, optimized code
3. **Add to Resources**: Place the SVG in `Sources/SEISwift/Resources/`
4. **Update the enum**: Add the new case to `SEIIcon.swift` in the appropriate category
5. **Verify loading**: Ensure the icon loads correctly in tests
6. **Update documentation**: Add the icon to README.md categories

### Code Style

- Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Use clear, descriptive names
- Add doc comments for all public APIs
- Include usage examples in documentation
- Maintain consistency with existing code

## Pull Request Process

1. **Create a feature branch**:
   ```bash
   git checkout -b feature/icon-name
   ```

2. **Make your changes** following the guidelines above

3. **Test thoroughly**:
   ```bash
   swift test
   swift build
   ```

4. **Commit with clear message**:
   ```bash
   git commit -m "Add [icon-name] icon to [Category] category"
   ```

5. **Push to your fork**:
   ```bash
   git push origin feature/icon-name
   ```

6. **Open a Pull Request** with:
   - Clear title describing the change
   - Description of what was added/changed
   - Screenshots (if adding/modifying icons)
   - Reference to related issues

7. **Respond to feedback**: Maintainers may request changes

### PR Requirements

Before submitting:
- [ ] All tests pass (`swift test`)
- [ ] Code builds without warnings (`swift build`)
- [ ] New icons are added to `SEIIcon.swift` enum
- [ ] New icons are documented in README.md
- [ ] SVG assets are optimized and clean
- [ ] Naming follows conventions
- [ ] Changes are documented in comments

## Questions?

If you have questions about contributing:

- Open a GitHub Discussion for general questions
- Open an Issue for bug reports or icon proposals
- Email legal@sxnnyside.com for licensing or legal questions
- Email support@sxnnyside.com for general support

---

**Thank you for contributing to SEISwift!**

*Sxnnyside Project © 2026*
