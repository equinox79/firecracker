[
    "/chat/($chat_re)/poll" => 'FireCracker::Handler::ChatPollHandler',
    "/chat/($chat_re)/mxhrpoll" => 'FireCracker::Handler::ChatMultipartPollHandler',
    "/chat/($chat_re)/post" => 'FireCracker::Handler::ChatPostHandler',
    "/chat/($chat_re)" => 'FireCracker::Handler::ChatRoomHandler',
];
