To create the release directory, navigate into the workspace where you want the release to be, and run:

```shell
$ bosh init-release --dir exemplar-release --git
```

You should now be able to change into the new `exemplar-release` directory where we can continue experimenting.

```shell
$ cd exemplar-release
```


## Best Practices

 * Releases should be version controlled to track changes and collaborate with other teams.
 * Use dashes in the release name.
