%%%===================================================================
%%% @copyright 2026 (c) Mathieu Kerjouan
%%% @author Mathieu Kerjouan
%%% @doc
%%% @end
%%%===================================================================
-module(buckaroo).
-export([start/0, stop/0]).

%%--------------------------------------------------------------------
%% @doc start buckaroo application and its dependencies.
%% @end
%%--------------------------------------------------------------------
start() ->
  application:ensure_all_started(buckaroo).

%%--------------------------------------------------------------------
%% @doc stop buckaroo application.
%% @end
%%--------------------------------------------------------------------
stop() ->
  application:stop(buckaroo).
