
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
      character.mutations = mutationGenerator.get_random_mutations(3);

      return character;
    }
  }
}

