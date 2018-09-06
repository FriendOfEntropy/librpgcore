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
  using Json;

  public class Character : GLib.Object, Json.Serializable {

    public string name { get; set; }
    public HashMap<string, Ability> abilities { get; set; }
    public HashMap<string, Mutation> mutations { get; set; }
    public HashMap<string, Mutation> defects { get; set; }

    public Character () {
      abilities = new HashMap<string, Ability>();
      mutations = new HashMap<string, Mutation>();
      defects = new HashMap<string, Mutation>();
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

    /**
     *
     */
    public virtual bool deserialize_property (string property_name, out Value @value, ParamSpec pspec, Json.Node property_node)
    {
      return default_deserialize_property (property_name, out @value, pspec, property_node);
    }

  }
}