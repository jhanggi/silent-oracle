# SilentOracle

Silences internal diagnostic messages from the [Oracle Enhanced](https://github.com/rsim/oracle-enhanced) connection adapter.

Enabled only in development and test environments, skips production for
performance reasons - logging is probably disabled there anyway.

Based off of Łukasz Piestrzeniewicz's [silent-postgres](https://github.com/dolzenko/silent-postgres) gem, released under the MIT license.
