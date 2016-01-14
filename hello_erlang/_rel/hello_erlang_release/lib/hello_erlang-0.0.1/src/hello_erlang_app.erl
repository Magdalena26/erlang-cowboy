-module(hello_erlang_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

% entry point to the application
%start/2 initialize routes for REST Dispatch=cowboy...
start(_Type, _Args) ->
%define the root of
	Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
% set up cowboy http server
    {ok,_} = cowboy:start_http(my_http_listener, 100, [{port, 8080}],
        [{env, [{dispatch, Dispatch}]}]
    ),
	hello_erlang_sup:start_link().

stop(_State) ->
	ok.
