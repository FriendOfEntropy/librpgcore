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

  using GLib;
  using Gee;

  public class AbilityGenerator : GLib.Object
  {
    RPGCore.Dice dice;

    public AbilityGenerator()
    {
      dice = new RPGCore.Dice();
    }

    public HashMap<string, Ability> get_random_abilities() {
      HashMap<string, Ability> rolledAbilities = new HashMap<string, Ability>();

      RPGCore.Ability str = roll_ability_4d6_drop_lowest("Strength", "STR");
      rolledAbilities.set (str.abbreviation, str);

      RPGCore.Ability dex = roll_ability_4d6_drop_lowest("Dexterity", "DEX");
      rolledAbilities.set (dex.abbreviation, dex);

      RPGCore.Ability con = roll_ability_4d6_drop_lowest("Constitution", "CON");
      rolledAbilities.set (con.abbreviation, con);

      RPGCore.Ability intel = roll_ability_4d6_drop_lowest("Intelligence", "INT");
      rolledAbilities.set (intel.abbreviation, intel);

      RPGCore.Ability wis = roll_ability_4d6_drop_lowest("Wisdom", "WIS");
      rolledAbilities.set (wis.abbreviation, wis);

      RPGCore.Ability cha = roll_ability_4d6_drop_lowest("Charisma", "CHA");
      rolledAbilities.set (cha.abbreviation, cha);

      return rolledAbilities;
    }

    private RPGCore.Ability roll_ability_4d6_drop_lowest (string name, string abbreviation) {
      RPGCore.Ability ab = new RPGCore.Ability(name, abbreviation);
      ab.score = dice.roll_dicetype(DiceType.d6, 4, true);  // 4d6 - drop lowest
      return ab;
    }


  }
}

