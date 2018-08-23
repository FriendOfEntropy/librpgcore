
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

  public class Character : GLib.Object {
    
    public string name { get; set; }    
    public HashMap<string, Ability> abilities { get; set; }
    public HashMap<string, Mutation> mutations { get; set; }

    public Character() {
      abilities = new HashMap<string, Ability>();
      mutations = new HashMap<string, Mutation>();
    }
    
    public string to_string()
    {
      // First prime abilities
      StringBuilder builder = new StringBuilder();
      Ability ability = abilities.get("STR");
      builder.append(ability.to_string() + "\n");
  
      ability = abilities.get("DEX");
      builder.append(ability.to_string() + "\n");
  
      ability = abilities.get("CON");
      builder.append(ability.to_string() + "\n");
  
      ability = abilities.get("INT");
      builder.append(ability.to_string() + "\n");
  
      ability = abilities.get("WIS");
      builder.append(ability.to_string() + "\n");
  
      ability = abilities.get("CHA");
      builder.append(ability.to_string() + "\n");
  
      return(builder.str);
    }

    public string to_html()
    {

      


      // First prime abilities
      StringBuilder builder = new StringBuilder();

      builder.append("<table>\n");
      builder.append("<tr><th>Abbrev</th><th>Ability</th><th>Score</th><th>Modifier</th></tr>\n");

      Ability ability = abilities.get("STR");
      builder.append(render_ability_row(ability));
  
      ability = abilities.get("DEX");
      builder.append(render_ability_row(ability));
  
      ability = abilities.get("CON");
      builder.append(render_ability_row(ability));
  
      ability = abilities.get("INT");
      builder.append(render_ability_row(ability));
  
      ability = abilities.get("WIS");
      builder.append(render_ability_row(ability));
  
      ability = abilities.get("CHA");
      builder.append(render_ability_row(ability));

      builder.append("</table> \n");

      return builder.str;
    }

    private string render_ability_row(Ability ability) {
      StringBuilder builder = new StringBuilder();
      builder.append("<tr>");
      builder.append("<td>" + ability.abbreviation + "</td>");
      builder.append("<td>" + ability.name + "</td>");
      builder.append("<td>" + ability.score.to_string() + "</td>");
      builder.append("<td>" + ability.modifier.to_string() + "</td>");
      builder.append("</tr>\n");
      return builder.str;
    }


  }
}