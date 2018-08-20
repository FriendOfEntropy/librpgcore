
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

