% http://learnyousomeerlang.com/buckets-of-sockets
% {ok, ListenSocket} = gen_tcp:listen(8091, [{active,true}, binary])

% -module(server).
% -export([server])

server() ->
    {ok, LSock} = gen_tcp: listen(5678, [binary, {packet, 0}, {active, false}]),
    {ok, Sock} = gen_tcp: accept(LSock),
    {ok, Bin} = do_recv(Sock, []),
    ok = gen_tcp: close(Sock),
    Bin.

do_recv(Sock, Bs) ->
    case gen_tcp: recv(Sock, 0) of
        {ok, B} ->
            do_recv(Sock, [Bs, B]);
        {error, closed} ->
            {ok, list_to_binary(Bs)}
    end.