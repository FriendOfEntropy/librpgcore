
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
  using Json;

  public class Character : GLib.Object, Json.Serializable {
    
    public string name { get; set; }    
    public HashMap<string, Ability> abilities { get; set; }
    public HashMap<string, Mutation> mutations { get; set; }

    public Character () {
      abilities = new HashMap<string, Ability>();
      mutations = new HashMap<string, Mutation>();
    }
    
    public string to_string ()
    {
      return(to_json()) ;
    }

    public string to_json ()
    {
      Json.Node root = Json.gobject_serialize (this);
      Json.Generator generator = new Json.Generator ();
      generator.pretty = true;
      generator.set_root (root);
      return generator.to_data (null);            
    }

    //  public string to_html ()
    //  {
    //    // first prime abilities
    //    StringBuilder builder = new StringBuilder();

    //    builder.append("<table class='primeAttributes'>\n");
    //    builder.append("<tr><th>Abbrev</th><th>Ability</th><th>Score</th><th>Modifier</th></tr>\n");

    //    Ability ability = abilities.get("STR");
    //    builder.append(render_ability_row(ability));
  
    //    ability = abilities.get("DEX");
    //    builder.append(render_ability_row(ability));
  
    //    ability = abilities.get("CON");
    //    builder.append(render_ability_row(ability));
  
    //    ability = abilities.get("INT");
    //    builder.append(render_ability_row(ability));
  
    //    ability = abilities.get("WIS");
    //    builder.append(render_ability_row(ability));
  
    //    ability = abilities.get("CHA");
    //    builder.append(render_ability_row(ability));

    //    builder.append("</table> \n");

    //    builder.append("\n\n");

    //    // next beneficial mutations
    //    builder.append("<table class='mutations'>\n");
    //    builder.append("<tr><th>Name</th></tr>\n");

    //    foreach (var entry in mutations.entries) {
    //      Mutation mut = entry.value;
    //      builder.append("<tr><td>" + mut.name + "</td></tr>");
    //    }
    //    builder.append("</table> \n");

    //    return builder.str;
    //  }

    //  private string render_ability_row(Ability ability) {
    //    StringBuilder builder = new StringBuilder();
    //    builder.append("<tr>");
    //    builder.append("<td>" + ability.abbreviation + "</td>");
    //    builder.append("<td>" + ability.name + "</td>");
    //    builder.append("<td>" + ability.score.to_string() + "</td>");
    //    builder.append("<td>" + ability.modifier.to_string() + "</td>");
    //    builder.append("</tr>\n");
    //    return builder.str;
    //  }


    //json serializable implementation

    public Json.Object? meta { get; construct set; default = null; }

    public unowned ParamSpec? find_property (string name)
    {
      return ((ObjectClass) get_type ().class_ref ()).find_property (name);
    }

    public virtual Json.Node serialize_property (string property_name, Value @value, ParamSpec pspec)
    {
      if (@value.type ().is_a (typeof (Json.Object)))
      {
        var obj = @value as Json.Object;
        if (obj != null)
        {
          var node = new Json.Node (NodeType.OBJECT);
          node.set_object (obj);
          return node;
        }
      }
      else if (@value.type ().is_a (typeof (HashMap)))
      {
        var hm = @value as HashMap<string, GLib.Object>;
  
        if (hm != null)
        {

          var array = new Json.Array.sized (hm.size);

          foreach (var item in hm.entries)
          {
            array.add_element (gobject_serialize (item.value));
          }
  
          var node = new Json.Node (NodeType.ARRAY);
          node.set_array (array);
          return node;

        }
      }
  
      return default_serialize_property (property_name, @value, pspec);
    }
  
    public virtual bool deserialize_property (string property_name, out Value @value, ParamSpec pspec, Json.Node property_node)
    {
      return default_deserialize_property (property_name, out @value, pspec, property_node);
    }

  }
}