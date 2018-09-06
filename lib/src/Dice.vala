/*
* Copyright (c) 2018 FriendOfEntropy (https://github.com/FriendOfEntropy/librpgcore)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU LESSER GENERAL PUBLIC
* LICENSE as published by the Free Software Foundation; either
* version 3 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: FriendOfEntropy <FriendOfEntropy@gmail.com>
*/

namespace RPGCore {

  using Gsl;

  public enum DiceType
  {
    d3 = 3,
    d4 = 4,
    d6 = 6,
    d8 = 8,
    d10 = 10,
    d12 = 12,
    d20 = 20;

    public string to_string ()
    {
      return ((EnumClass) typeof (DiceType).class_ref ()).get_value (this).value_name;
    }

  }



  /// <summary>
  /// The Dice class wraps the Random class, automatically providing seeding.
  /// </summary>
  public class Dice
  {
    RNGType* T;
    RNG r;

    public Dice()
    {
      //DateTime now = new DateTime.now_local ();
      //int seed = now.get_hour() + now.get_microsecond () + now.get_minute() + now.get_second ();
      //rand = new Rand.with_seed(seed);

      RNG.env_setup ();
      T = (RNGType*) RNGTypes.default;
      r = new RNG (T);
    }

    public int roll_dicetype(RPGCore.DiceType dicetype, int numberOfDice = 1, bool dropLowestRoll = false)
    {
      return roll(numberOfDice, 1, (int) dicetype, dropLowestRoll);
    }

    public int roll_range(int min, int max, int numberOfDice = 1, bool dropLowestRoll = false)
    {
      return roll(numberOfDice, min, max, dropLowestRoll);
    }

    private int roll(int numberOfRolls, int min, int max, bool dropLowestRoll)
    {
      DateTime now = new DateTime.now_local ();
      int seed = now.get_hour() + now.get_microsecond () + now.get_minute() + now.get_second ();
      r.set(seed);

      List<int> results = new List<int>();
      int total = 0;

      int result = -1;

      for(uint x = 0; x <= (numberOfRolls - 1); x++) {

        do {
          ulong u = r.uniform_int (max);
          result = (int) u + 1;
        }
        while (result < min);
        results.append(result);
      }
      results.sort(intcmp);

      if (dropLowestRoll) {
        unowned List<int>? element = results.first ();
        results.remove (element.data);
      }

      foreach (int i in results) {
        total += i;
      }
      return total;
    }

    // Integer Comparison like strcmp
    CompareFunc<int> intcmp = (a, b) => {
      return (int) (a > b) - (int) (a < b);
    };

    //  CompareFunc<int> intcmp_reverse = (a, b) => {
    //      return (int) (a < b) - (int) (a > b);
    //  };
  }
}