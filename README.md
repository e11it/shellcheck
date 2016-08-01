# ShellCheck

Unofficial build of ShellCheck, static analysis tool for shell scripts running
within a docker container.

## Launch Command

```bash
docker run --rm -v $(pwd)/SHELLSCRIPT.sh:/tmp/FileToBeChecked -it e11it/shellcheck
```

