%%%===================================================================
%%% @copyright 2026 (c) Mathieu Kerjouan
%%% @author Mathieu Kerjouan
%%% @doc
%%% @end
%%%===================================================================
-module(buckaroo_handler).
-export([init/2]).

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
init(Req, State) ->
  Reply = cowboy_req:reply(200,
    #{
      <<"content-type">> => <<"text/plain">>
    },
    <<"hello">>,
    Req
  ),
  {ok, Reply, State}.

