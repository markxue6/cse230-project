module Model where 

import Prelude hiding ((!!))
import qualified Model.Board  as Board
import qualified Model.Score  as Score
import qualified Model.Player as Player

-------------------------------------------------------------------------------
-- | Top-level App State ------------------------------------------------------
-------------------------------------------------------------------------------

data State 
  = Intro 
  | Play PlayState 
  | Outro 
  
data PlayState = PS
  { psX     :: Player.Player  -- ^ player X info
  , psO     :: Player.Player  -- ^ player O info
  , psScore :: Score.Score    -- ^ current score
  , psBoard :: Board.Board    -- ^ current board
  , psTurn  :: Board.XO       -- ^ whose turn 
  , psPos   :: Board.Pos      -- ^ current cursor
  } 

init :: Int -> PlayState
init n = PS 
  { psX     = Player.human
  , psO     = Player.rando
  , psScore = Score.init n
  , psBoard = Board.init
  , psTurn  = Board.X
  , psPos   = head Board.positions 
  }

isCurr :: PlayState -> Int -> Int -> Bool
isCurr s r c = Board.pRow p == r && Board.pCol p == c
  where 
    p = psPos s 
