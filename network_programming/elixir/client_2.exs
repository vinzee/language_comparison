socket = Socket.TCP.connect! {"127.0.0.1", 1337}
socket |> Socket.Stream.send!("hello!")