---
title: CLI
description: How to use the command line interface (CLI) for Flutter Distributor
---

## Installation

```
dart pub global activate flutter_distributor
```

## Commands

> These commands are sorted in alphabetical order. The most commonly used are package, publish, and release.

### Package

Will package your application into a platform specific format and put the result in a folder.

<table><thead><tr><th>Flag</th><th>Value</th><th data-type="checkbox">Required</th></tr></thead><tbody><tr><td><code>--platform</code></td><td>Platform, e.g. <code>android</code></td><td>true</td></tr><tr><td><code>--targets</code></td><td>Comma separated list of maker names</td><td>true</td></tr><tr><td><code>--skip-clean</code></td><td>Skip clean once before build</td><td>false</td></tr></tbody></table>

Example:

```
flutter_distributor package --platform=android --targets=aab,apk
```

### Publish

<table><thead><tr><th>Flag</th><th>Value</th><th data-type="checkbox">Required</th></tr></thead><tbody><tr><td><code>--path</code></td><td>Path, e.g. <code>hello_world-1.0.0+1-android.apk</code></td><td>true</td></tr><tr><td><code>--targets</code></td><td>Comma separated list of publisher names</td><td>true</td></tr></tbody></table>

Example:

```
flutter_distributor publish --path hello_world-1.0.0+1-android.apk --targets fir,pgyer
```

### Release

Will according to the configuration file (`distribute_options.yaml`), package your application into a specific format and publish it to the distribution platform.

<table><thead><tr><th>Flag</th><th>Value</th><th data-type="checkbox">Required</th></tr></thead><tbody><tr><td><code>--name</code></td><td>Name, e.g. <code>dev</code></td><td>true</td></tr><tr><td><code>--skip-clean</code></td><td>Skip clean once before build</td><td>false</td></tr></tbody></table>

Example:

```
flutter_distributor release --name dev
```
