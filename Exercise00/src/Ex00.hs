module Ex00 where

name, idno, username :: String
name      =  "Elliot Lyons"  -- replace with your name
idno      =  "20333366"    -- replace with your student id
username  =  "lyonse7"   -- replace with your TCD username


declaration -- do NOT modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]

{- Modify everything below here to ensure all tests pass -}

hello  =  "Hello World :-)"
