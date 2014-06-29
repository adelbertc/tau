module Bot where

-- The conf type. Feel free to change it.
type Conf = (String, String)

-- the initial conf value. can use IO to construct
mkConf :: IO Conf
mkConf = do
  return ("Nobody", "hello")

-- Takes a conf, does some IO and returns a list of messages to reply with and a conf.
-- Use the conf to pass state around.
receiveMessage :: Conf -> String -> String -> String -> String -> IO ([String], Conf)
receiveMessage conf xmpproom from to ('!':' ':msg) = do
  return ([fst conf ++ " said: " ++ snd conf], (from, msg))

-- default case, all messages
receiveMessage conf xmpproom from to _msg = do
  -- don't reply with something if the message doesn't start with !. you could get in a loop!
  return ([], conf)
