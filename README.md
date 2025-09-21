A small selection of OpenBSD userland utilities ported to Linux.

Currently included: `cat`, `echo`, `pwd`, `md5`, `mkdir`.

## Getting Started

The quickest way to build is to run everything inside a throwaway Docker container, mounting the project at `/playground`.

1. Clone the repo and move to the project's parent directory:

   ```
   git clone git@github.com:tutorin-tech/playground.git
   cd playground
   ```
2. Start an Ubuntu container with the project mounted:

   ```
   docker run --rm -it -v ".:/playground" ubuntu:24.04 bash
   ```
3. Inside the container, install dependencies and build:

   ```
   # as root
   apt update
   apt install -y build-essential cmake pkg-config libmd-dev
   # as ubuntu user
   su ubuntu
   cd /playground
   mkdir -p build
   cd build
   cmake ..
   cmake --build .
   ```

## Contributing

Clear, consistent commit messages make reviews easy and the history useful. Please follow these rules.

#### 1) One logical change per commit

* Separate upstream imports from local changes.
* Batch mechanical edits of the same kind across files under a single `treewide:` commit.

#### 2) Subject line

* Format:

  ```
  <scope>: <imperative verb ...>
  ```

  where `<scope>` is the smallest meaningful area: `cat`, `echo`, `pwd`, `md5`.
* Keep it __less or equal__ 72 chars, no trailing period, use present imperative ("add", "fix", "guard", "link").

**Good examples**

* `Import cat from OpenBSD 7.7`
* `cat: do not use OpenBSD-specific pledge syscall`

**Avoid**

* `fix stuff`
* `update`
* `linux changes`
* `ported md5 and misc tweaks` (split into separate commits)


