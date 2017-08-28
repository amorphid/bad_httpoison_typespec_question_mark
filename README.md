# Foo

## Basic usage

    iex(1)> flush      
    :ok
    iex(2)> Foo.get("http://www.example.com")
    {:ok, %HTTPoison.AsyncResponse{id: #Reference<0.1785870032.3633315841.234624>}}
    iex(3)> flush
    %HTTPoison.AsyncStatus{code: 200,
    id: #Reference<0.1785870032.3633315841.234624>}
    %HTTPoison.AsyncHeaders{headers: [{"Cache-Control", "max-age=604800"},
    {"Content-Type", "text/html"}, {"Date", "Mon, 28 Aug 2017 16:38:47 GMT"},
    {"Etag", "\"359670651+gzip+ident\""},
    {"Expires", "Mon, 04 Sep 2017 16:38:47 GMT"},
    {"Last-Modified", "Fri, 09 Aug 2013 23:54:35 GMT"},
    {"Server", "ECS (rhv/818F)"}, {"Vary", "Accept-Encoding"}, {"X-Cache", "HIT"},
    {"Content-Length", "1270"}], id: #Reference<0.1785870032.3633315841.234624>}
    %HTTPoison.AsyncChunk{chunk: "<!doctype html>\n<html>\n<head>\n    <title>Example Domain</title>\n\n    <meta charset=\"utf-8\" />\n    <meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\" />\n    <style type=\"text/css\">\n    body {\n        background-color: #f0f0f2;\n        margin: 0;\n        padding: 0;\n        font-family: \"Open Sans\", \"Helvetica Neue\", Helvetica, Arial, sans-serif;\n        \n    }\n    div {\n        width: 600px;\n        margin: 5em auto;\n        padding: 50px;\n        background-color: #fff;\n        border-radius: 1em;\n    }\n    a:link, a:visited {\n        color: #38488f;\n        text-decoration: none;\n    }\n    @media (max-width: 700px) {\n        body {\n            background-color: #fff;\n        }\n        div {\n            width: auto;\n            margin: 0 auto;\n            border-radius: 0;\n            padding: 1em;\n        }\n    }\n    </style>    \n</head>\n\n<body>\n<div>\n    <h1>Example Domain</h1>\n    <p>This domain is established to be used for illustrative examples in documents. You may use this\n    domain in examples without prior coordination or asking for",
    id: #Reference<0.1785870032.3633315841.234624>}
    %HTTPoison.AsyncChunk{chunk: " permission.</p>\n    <p><a href=\"http://www.iana.org/domains/example\">More information...</a></p>\n</div>\n</body>\n</html>\n",
    id: #Reference<0.1785870032.3633315841.234624>}
    %HTTPoison.AsyncEnd{id: #Reference<0.1785870032.3633315841.234624>}
    :ok

## Intentionally incorrect typespecs

The typespecs for `&Foo.get/0` and `&Foo.get/1` have typespecs that are intentionally invalid.  `&Foo.get/0` expectedly suggests the correct success typing.  `&Foo.get/1` does not.

    $ mix dialyzer
    Compiling 1 file (.ex)
    Checking PLT...
    [:asn1, :certifi, :compiler, :crypto, :elixir, :hackney, :httpoison, :idna,
    :kernel, :logger, :metrics, :mimerl, :public_key, :ssl, :ssl_verify_fun,
    :stdlib, :unicode_util_compat]
    PLT is up to date!
    Starting Dialyzer
    dialyzer args: [check_plt: false,
    init_plt: '/Users/amorphid/my/code/github.com/amorphid/bad_httpoison_typespec_question_mark/_build/dev/dialyxir_erlang-20.0_elixir-1.5.1_deps-dev.plt',
    files_rec: ['/Users/amorphid/my/code/github.com/amorphid/bad_httpoison_typespec_question_mark/_build/dev/lib/bad_httpoison_typespec_question_mark/ebin'],
    warnings: [:unknown]]
    done in 0m2.58s
    lib/bad_httpoison_typespec_question_mark.ex:8: Invalid type specification for function 'Elixir.Foo':get/0. The success typing is () -> 'not_1'
    lib/bad_httpoison_typespec_question_mark.ex:14: Function get/1 has no local return
    done (warnings were emitted)
