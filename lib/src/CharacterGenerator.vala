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

  public class CharacterGenerator : GLib.Object
  {
    RPGCore.Dice dice;
    Character character;

    public CharacterGenerator()
    {
      dice = new RPGCore.Dice();
      character = new Character();
    }

    public Character generate_random_character() {

      AbilityGenerator abilityGenerator = new AbilityGenerator();
      MutationGenerator mutationGenerator = new MutationGenerator();

      character.abilities = abilityGenerator.get_random_abilities();

      character.mutations = mutationGenerator.get_random_mutations(MutationType.BENEFICIAL, 3);

      dice = new RPGCore.Dice();

      // begin resolving mutation details
      string mentalAbilityTag = "<MentalAbility>";
      string physicalAbilityTag = "<PhysicalAbility>";
			foreach (var entry in character.mutations.entries) {
        Mutation mut = entry.value;
        Ability ab;
        string abilityKey;

        if (mut.name.contains(mentalAbilityTag)) {
          int result = dice.roll_dicetype(DiceType.d6);
          switch (result) {
            case 1:
            case 6:
              abilityKey = "INT";
              break;
            case 3:
            case 4:
              abilityKey = "WIS";
              break;
            default:
              abilityKey = "CHA";
              break;
          }
          ab = character.abilities.get(abilityKey);
          mut.name = mut.name.replace (mentalAbilityTag, ab.name);
          ab.score += 1;
        }


        if (mut.name.contains(physicalAbilityTag)) {
          int result = dice.roll_dicetype(DiceType.d6);
          switch (result) {
            case 1:
            case 6:
              abilityKey = "STR";
              break;
            case 3:
            case 4:
              abilityKey = "DEX";
              break;
            default:
              abilityKey = "CON";
              break;
          }
          ab = character.abilities.get(abilityKey);
          mut.name = mut.name.replace (physicalAbilityTag, ab.name);
          ab.score += 1;
        }
			}

      character.defects = mutationGenerator.get_random_mutations(MutationType.DEFECT, 3);

      // begin resolving defect details
			foreach (var entry in character.defects.entries) {
        Mutation mut = entry.value;
        Ability ab;
        string abilityKey;
        if (mut.name.contains(physicalAbilityTag)) {
          int result = dice.roll_dicetype(DiceType.d6);
          switch (result) {
            case 1:
            case 6:
              abilityKey = "STR";
              break;
            case 3:
            case 4:
              abilityKey = "DEX";
              break;
            default:
              abilityKey = "CON";
              break;
          }
          ab = character.abilities.get(abilityKey);
          mut.name = mut.name.replace (physicalAbilityTag, ab.name);
          ab.score -= 1;
        }
			}

      return character;
    }
  }
}