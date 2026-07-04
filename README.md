# Prancing Pony Pub

**Requirements**

- Python installed on your system
- Install dependencies:

``` sh
pip install mkdocs-material mike
```

**Running MESBG 2024**

``` sh
mkdocs serve --config-file .\mkdocs-2024.yml
```

**Running MESBG 2018**

``` sh
mkdocs serve --config-file .\mkdocs-2018.yml
```

**Running Both Versions Locally**

Use the versioned local runner:

``` sh
start_both.bat
```

This builds both versions with `mike`, sets `mesbg2024` as the default, and serves the combined site at `http://127.0.0.1:8000/`.

**Publishing**

Push to `main` or `master`. GitHub Actions builds `mesbg2018` and `mesbg2024` with `mike` and pushes the result to `gh-pages`.
