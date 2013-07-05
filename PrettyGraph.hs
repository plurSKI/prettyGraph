import Graphics.GD

type Value = (Point, RGB)
type Coord = (Int, Int)
type RGB   = (Int, Int, Int)

points = [(x,y) | x <- [-250..250], y <- [-250..250]]


makeImg :: Int -> Int -> Int -> [Value] -> IO()
makeImg num scale imgSize xs = do
  img <- newImage (imgSize * scale, imgSize * scale)
  mapM_ (drawPoint img scale) xs
  savePngFile ("data/test" ++ show (3*num) ++ ".png") img
  savePngFile ("data/test" ++ show (3*num + 1) ++ ".png") img
  savePngFile ("data/test" ++ show (3*num + 2) ++ ".png") img
  where drawPoint img scale ((x,y),(r,g,b)) = drawFilledRectangle (x*scale,y*scale) (x*scale + scale,y*scale + scale) (rgb r g b) img
        halfSize = imgSize `div` 2

testFunc :: (Double, Double) -> Coord -> Value
testFunc (c1, c2) p@(x,y) = ((x + 250, y + 250), newRgb)
  where newRgb = (val 1, val 2, val 3)
        val n  = 0 + ((c `div` n) `mod` 255) 
        c      = floor $ sin(c1*x') + cos(c2*y')
        (x', y') = (fromIntegral x, fromIntegral y)


runStep 0 = putStrLn "DONE"
runStep x = do makeImg x 1 500 $ map (testFunc (x'*0.1, x'*0.1)) points
               print x
               runStep (x - 1)
 where x' = fromIntegral x


main = runStep 500
