<%!
    import config.python
%>name: build
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]
jobs:
  build:
    name: Build on ${"${{ matrix.container }}"}
    runs-on: ubuntu-latest
    container: ${"${{ matrix.container }}"}
    strategy:
      matrix:
        container: ${config.python.test_container}
        # python-version: ${config.python.test_python}
    steps:
    - uses: actions/checkout@v2
    - name: Install system-wide dependencies
      run: |
        apt-get update
        apt-get install -y lilypond qpdf python3 python3-pip git
        python3 -m pip install --upgrade pip
        pip install -r requirements.txt
        make
        make all_tunes
