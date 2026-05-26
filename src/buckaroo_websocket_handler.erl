%%%===================================================================
%%% @copyright 2026 (c) Mathieu Kerjouan
%%% @author Mathieu Kerjouan
%%% @doc
%%% @end
%%%===================================================================
-module(buckaroo_websocket_handler).
-export([init/2]).
-export([websocket_init/1, websocket_handle/2, websocket_info/2]).
-include_lib("kernel/include/logger.hrl").

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
init(Req, State) ->
  WebSocketOpts = #{
    active_n => 1,
    compress => false,
    data_delivuery => stream_handlers,
    data_delivery_flow => 1,
    deflate_opts => #{},
    dynamic_buffer => {1024, 131_072},
    idle_timeout => 60_000,
    max_frame_size => 120_000,
    req_filter => fun(Req) -> Req end,
    validate_utf8 => true
  },
  ?LOG_DEBUG("~p:~p: ~p~n", [
    ?MODULE,
    ?FUNCTION_NAME,
    WebSocketOpts,
    Req
  ]),
  {cowboy_websocket, Req, State, WebSocketOpts}.

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
websocket_init(State) ->
  ?LOG_DEBUG("~p:~p: ~p~n", [?MODULE, ?FUNCTION_NAME]),
  {[{text, <<"hey">>}], State}.

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
websocket_handle(Frame = {text, Message}, State) ->
  ?LOG_DEBUG("~p:~p: ~p, ~p~n", [?MODULE, ?FUNCTION_NAME, Frame]),
  {[{text, Message}], State};
websocket_handle(Frame = {binary, Message}, State) ->
  ?LOG_DEBUG("~p:~p: ~p, ~p~n", [?MODULE, ?FUNCTION_NAME, Frame]),
  {[{binary, Message}], State};
websocket_handle(Frame, State) ->
  ?LOG_DEBUG("~p:~p: ~p, ~p~n", [?MODULE, ?FUNCTION_NAME, Frame]),
  {[Frame], State}.

%%--------------------------------------------------------------------
%% @doc
%% @end
%%--------------------------------------------------------------------
websocket_info(Event, State) ->
  ?LOG_DEBUG("~p:~p: ~p, ~p~n", [?MODULE, ?FUNCTION_NAME, Event]),
  {ok, State}.
