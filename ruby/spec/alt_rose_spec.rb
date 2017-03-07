require 'alt_rose'

describe AltRose do

end



-feature: sell_in value
  -describe: sell_in values change correctly
    -context: item != sulfuras
      -sell_in decreases by 1 for all items expect sulfuras
    -context: item == sulfuras
      -sell_in stays static for sulfuras

-feature: item quality
  -describe: item quality updates correctly
    -context: item quality > 0
    -when sell_in
      -doesnt change quality value of sulfuras
      -brie increases in value by @multiple with time
      -unnamed items decrease in value by @multiple with time
      -conjured items decrease in value by @multiple with time
    -context: item quality == 0
      -quality doesnt go below 0
    -context: item quality == 50
      -quality doesnt exceed 50

-feature: item appreciation values
  -describe: check it returns the right value for multiple
    -context: sell_in >= 0 (on or before sell_by date)
      -brie == 1
      -unnamed items == -1
      -conjured items == -2

    -context: sell_in < 0 (sell_by reached or past); depreciation 2x as fast
      -brie == 1
      -unnamed items == -2
      -conjured items == -4

  -describe: special cases
    -context: backstage passes
      -multiple for backstage passes == 1
      -multiple == 2 when sell_in < 11
      -multiple == 3 when sell_in < 5,
      -quality drops to 0 when sell_in == 0

    -context: sulfuras
      -multiple does not exist || multiple == 1
