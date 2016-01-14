-module(hello_erlang_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

%supervisor can restart process if the are disabled

-spec start_link() -> {ok, pid()}.

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	Procs = [],
	{ok, {{one_for_one, 1, 5}, Procs}}.
