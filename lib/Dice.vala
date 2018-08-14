
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
    Rand rand;
    
    public Dice()
    {
      DateTime now = new DateTime.now_local ();
      int seed = now.get_hour() + now.get_microsecond () + now.get_minute() + now.get_second ();
      rand = new Rand.with_seed(seed);
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
      List<int> results = new List<int>();
      int total = 0;

      for(uint x = 0; x <= (numberOfRolls - 1); x++) {
        int result = rand.int_range(min, max);
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