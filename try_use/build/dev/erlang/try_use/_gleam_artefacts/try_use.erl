-module(try_use).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/try_use.gleam").
-export([main/0]).

-file("src/try_use.gleam", 4).
-spec catify_without_use(list(binary())) -> list(binary()).
catify_without_use(Strings) ->
    gleam@list:map(Strings, fun(String) -> <<String/binary, " cat"/utf8>> end).

-file("src/try_use.gleam", 8).
-spec catify_with_use(list(binary())) -> list(binary()).
catify_with_use(Strings) ->
    gleam@list:map(Strings, fun(String) -> <<String/binary, " cat"/utf8>> end).

-file("src/try_use.gleam", 13).
-spec main() -> nil.
main() ->
    gleam_stdlib:println(<<"Hello from try_use!"/utf8>>),
    String_list = [<<"Joe"/utf8>>, <<"Sam"/utf8>>, <<"Archie"/utf8>>],
    gleam@list:each(
        catify_without_use(String_list),
        fun(Catified_str) -> gleam_stdlib:println(Catified_str) end
    ),
    gleam@list:each(
        catify_with_use(String_list),
        fun(Catified_str@1) -> gleam_stdlib:println(Catified_str@1) end
    ).
