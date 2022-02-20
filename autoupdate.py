#!/usr/bin/env python3
from __future__ import annotations
from typing import *

import json
import functools
import pathlib
import urllib.request

import semver


if TYPE_CHECKING:
    Version = str
    RemoteFilePath = str


CURRENT_DIR = pathlib.Path(__file__).parent
JSON_INDEXES = {
    "release": "https://packages.edgedb.com/archive/.jsonindexes/x86_64-apple-darwin.json",
    "nightly": "https://packages.edgedb.com/archive/.jsonindexes/x86_64-apple-darwin.nightly.json",
}
VERSION_BLOCKLIST = {"1.0a3"}


def query_latest_version(*, nightly: bool) -> Tuple[Version, RemoteFilePath]:
    kind = "nightly" if nightly else "release"
    with urllib.request.urlopen(JSON_INDEXES[kind]) as url:
        indexes = json.load(url)
    versions_to_paths: Dict[Version, RemoteFilePath] = {}
    for package in indexes["packages"]:
        if not package["name"] == "edgedb-cli":
            continue
        if package["version"] in VERSION_BLOCKLIST:
            continue
        path = package["installref"].split("/")[-1]
        versions_to_paths[package["version"]] = path
    latest_version = sorted(
        versions_to_paths,
        key=functools.cmp_to_key(semver.compare),
        reverse=True,
    )[0]
    return latest_version, versions_to_paths[latest_version]


def update_in_place(path: pathlib.Path, *, nightly: bool) -> None:
    version, remote_file_path = query_latest_version(nightly=nightly)
    kind = "nightly" if nightly else "release"
    with path.open() as source:
        source_lines = source.readlines()

    with path.open("w") as target:
        expect_download_file_path = False
        for line in source_lines:
            line_s = line.strip()
            if expect_download_file_path and line_s.startswith('"'):
                new = f'"{remote_file_path}"'
                if line_s != new:
                    print(f"in {kind}: s/{line_s}/{new}/")
                print("    " + new, file=target)
                expect_download_file_path = False
                continue
            if line_s.startswith("version"):
                new = f'version "{version}"'
                if line_s != new:
                    print(f"in {kind}: s/{line_s}/{new}/")
                print("  " + new, file=target)
                continue
            if line_s.startswith("def self.download_file_path"):
                expect_download_file_path = True
            print(line.rstrip(), file=target)


def main() -> None:
    release_cli = CURRENT_DIR / "Formula" / "edgedb-cli.rb"
    nightly_cli = CURRENT_DIR / "Formula" / "edgedb-cli-nightly.rb"
    update_in_place(release_cli, nightly=False)
    update_in_place(nightly_cli, nightly=True)


if __name__ == "__main__":
    main()
