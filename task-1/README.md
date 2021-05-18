# build instruction / usage
It is a simple bash script, run it with:

```sh
$ bash script.sh
7 10 3 2 5 8 9 1 6 4
```

# description
Produce the desired output with the minimum code use,
also this could be shortened even more if we want to use
some extra tools on top of bash, like:

```sh
$ echo $(seq 1 10 | shuf -)
7 6 3 1 8 9 10 4 5 2
```

# tests
I added a second script 'test.sh' that add some test based on
the description of the problem:

* output should contain only number between 1-10
* output should not contain duplicated Number

# limitation / bug
Actually the input data is hardcoded so it could use some getops code,
to manage argument and user interaction.

Depending on the input data size, and the complexity of process,
the usage and what language the team is confortable with,
it could be worth, to create an optimized version (python / rust).
