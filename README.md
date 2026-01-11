#  EAN13View

[![Build Status](https://travis-ci.org/dkpoulsen/EAN13View.svg?branch=master)](https://travis-ci.org/dkpoulsen/EAN13View)

## Installation

### Swift Package Manager

Add EAN13View as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/dkpoulsen/EAN13View.git", from: "1.0.0")
]
```

Or add it via Xcode:
1. File → Add Packages
2. Enter: `https://github.com/dkpoulsen/EAN13View.git`

## Usage

### Barcode only

```swift
        let ean = try! EAN13(value: "5901234123457")
        let view = UIStackView(ean13: ean)
```

### Barcode with numeric display

```swift
        let ean = try! EAN13(value: "5901234123457")
        let view = EAN13View(ean13: ean)
```

![EAN13](barcode.png)