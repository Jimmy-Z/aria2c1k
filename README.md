# aria2c1k
[aria2](https://aria2.github.io/) concurrent connection limit lifted, since [tatsuhiro rejected the propose](https://github.com/aria2/aria2/issues/729)

list of changes:

    OptionHandlerFactory.cc, PREF_MAX_CONNECTION_PER_SERVER, 16 -> 1024
    OptionHandlerFactory.cc, PREF_MIN_SPLIT_SIZE, 1_m -> 64_k
    OptionHandlerFactory.cc, PREF_PIECE_LENGTH, 1_m -> 64_k

[binary download](https://github.com/Jimmy-Z/aria2c1k/releases)
