
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

  public class Ability : GLib.Object {
    public int score { get; set; }
    public string name { get; set; }
    public string abbreviation { get; set; }
    public string desc { get; set; }

    public int modifier { 
      get {
        return (score / 2) -5;
      } 
    }

    public Ability(string name, string abbreviation) {
      this.name = name;
      this.abbreviation = abbreviation;
    }

    public string to_string()
    {
      string paddedName = (string.nfill(12, ' ') + name);
      string paddedScore = string.nfill(2, ' ') + score.to_string();
      string trimmedName = paddedName.substring(paddedName.char_count() - 12, 12);
      string trimmedScore = paddedScore.substring(paddedScore.char_count() - 2, 2);
      return trimmedName  + ": " + trimmedScore + "  (% d)".printf(modifier);
    }
  }
}