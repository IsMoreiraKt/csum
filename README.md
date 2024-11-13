# csum
A command-line tool for calculating checksums with ease, featuring multi-algorithm support and color-coded output for intuitive and efficient use.

## Overview
`csum` is designed to provide a straightforward way to calculate checksums for files, using various algorithms. With user-friendly output and multiple options for customization, `csum` is an essential utility for developers and system administrators alike.

## Key Features
- **Flexible Algorithm Support**: Choose from multiple checksum algorithms.
- **Comprehensive Commands**: Access help, check versioning, and verify file checksums effortlessly.
- **Enhanced Visuals**: Color-coded output for improved readability.

## Prerequisites
Ensure the following dependencies are installed on your system:

- **Crystal**: A fast, compiled language with Ruby-like syntax.
- **Make**: A build automation tool to compile and manage project dependencies.

## Quick Start Guide

### Verify Dependencies
Before proceeding, confirm that all required dependencies are present:

```bash
make dependency
```

### Installation Steps

1. **Clone the Repository**:
```bash
git clone https://github.com/IsMoreiraKt/csum
cd csum
```

2. **Compile the Project**:
```bash
make
```

3. **Install the Tool**:
```bash
sudo make install
```

### Clean Build Files
To remove compiled files and clean up your project directory:

```bash
make clean
```

## Usage
Calculating the checksum of a file is simple:

```bash
csum [FLAGS] [FILE]
```

## Command Reference
- **`csum --help`**** | ****`csum -h`**: Display a detailed help message with all available commands.
- **`csum --version`**** | ****`csum -v`**: Show the current version of `csum`.
- **`csum --sysv`**** | ****`csum -s`**: Compute the checksum using the System V sum algorithm (512-byte blocks).
- **`csum`**** | ****`csum -r`**: Use the default BSD sum algorithm (1K blocks).