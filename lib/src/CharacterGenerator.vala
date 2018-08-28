
/* Copyright 2018 FriendOfEntropy <FriendOfEntropy@gmail.com>
 *
 * This file is part of rpgcore.
 *
 * FriendOfEntropy licenses this file to you under the MIT license.
 * See the LICENSE file in the project root for more information.
 *
 * rpgcore IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
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

