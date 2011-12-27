my $chat_re = '[\w\.\-]+';
[
    "/" => 'FireCracker::Handler::Root',
    "/chat/($chat_re)/poll" => 'FireCracker::Handler::ChatPollHandler',
    "/chat/($chat_re)/mxhrpoll" => 'FireCracker::Handler::ChatMultipartPollHandler',
    "/chat/($chat_re)/post" => 'FireCracker::Handler::ChatPostHandler',
    "/chat/($chat_re)/slide" => 'FireCracker::Handler::ChatSlideHandler',
    "/chat/($chat_re)" => 'FireCracker::Handler::ChatRoomHandler',
];
