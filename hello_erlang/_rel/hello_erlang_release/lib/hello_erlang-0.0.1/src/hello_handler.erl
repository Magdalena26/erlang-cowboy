-module(hello_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

% the firt callback common to all handlers, used to identify the type of the handler
init(_, Req, _Opts) ->
	
	case lists:keyfind(lang, 1, _Opts) of
        false ->
            {ok, Req2} = cowboy_req:reply(500, [
                {<<"content-type">>, <<"text/plain">>}
            ], "Achievement unlocked!\nYour first cowboy release!\nThough You are still missing option 'lang'.\n\n", Req),
            {shutdown, Req2, no_state};
        _ ->
            {ok, Req, no_state}
    end.

handle(Req, State=#state{}) ->
	{ok, Req2} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}],
        <<"Hello Erlang!">>, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
