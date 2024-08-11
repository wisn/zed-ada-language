# Zed Ada Language

Ada language support for Zed.

## Prerequisite

### Ada Language Server

Please install Ada Language Server (ALS) provided by AdaCore from
[AdaCore/ada_language_server](https://github.com/AdaCore/ada_language_server) repository.
We can download the pre-compiled binary on the release page.
Make sure to move the binary somewhere (bin directory) so it is available in the PATH environment variable.

## Acknowledgment

The [wisn/tree-sitter-ada](https://github.com/wisn/tree-sitter-ada) repository that is used by this project
is forked from the [briot/tree-sitter-ada](https://github.com/briot/tree-sitter-ada) repository.
All of the files below were originally created by [@briot](https://github.com/briot).

```
languages/
└── ada
    ├── folds.scm
    ├── highlights.scm
    ├── locals.scm
    └── textobjects.scm
```

Thus, all the credits go to @briot.
However, there might be some modifications to those files depending on my need
to support the Ada programming language on the Zed text editor.

## License

This project is licensed under the [MIT License](LICENSE).
