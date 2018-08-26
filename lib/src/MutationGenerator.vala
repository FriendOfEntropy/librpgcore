
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

	public errordomain ParseError {
		INVALID_FORMAT
	}

	/// <summary>
	/// 
	/// </summary>
	public class MutationGenerator : GLib.Object
	{
		public MutationGenerator()
		{
		}



		//  public HashMap<string, Mutation> get_random_mutations_cost_constrained(int allowedCost) {
		//    HashMap<string, Mutation> rolledMutations = new HashMap<string, Mutation>();
		//    int totalCost = 0;
		//    do { 
		//      Mutation m = get_beneficialmutation();
		//      if (!rolledMutations.has_key(m.name)) {
		//        if ((totalCost + m.mp) <= allowedCost) {
		//          rolledMutations.set (m.name, m);
		//          totalCost += m.mp;
		//        }
		//      }
		//    } 
		//    while (totalCost < allowedCost); 
		//    return rolledMutations;
		//  }
		
		public HashMap<string, Mutation> get_random_mutations(int numberOfMutations) {
			HashMap<string, Mutation> rolledMutations = new HashMap<string, Mutation>();
			Dice d = new Dice();

			for (int i = 1; i <= numberOfMutations; i++) { 
				Mutation m = get_beneficialmutation();
				if (rolledMutations.has_key (m.name)) {
					i--;
				}
				else {
					rolledMutations.set (m.name, m);
				}
			}

			return rolledMutations;
		}


		public Mutation get_beneficialmutation() {
			Mutation response = null;
			HashMap<string, Mutation> possibleMutations = get_possbile_beneficial_mutations();
			
			Dice d = new Dice();
			int result = d.roll_range(1, 128, 1, false);

			foreach (var entry in possibleMutations.entries) {
				Mutation mut = entry.value;
				if ((result >= mut.from) && (result <= mut.to)) {
					response = mut;
					break;
				}
			}
			d = null;
			return response;
		}

		private HashMap<string, Mutation> get_possbile_beneficial_mutations() {
			HashMap<string, Mutation> possibleMutations = new HashMap<string, Mutation>();
			File jsonFile;
			jsonFile = File.new_for_uri ("resource:///data/ogl/MutationsBeneficial.json");
			if (jsonFile.query_exists ()) {
				try {
						FileInputStream stream = jsonFile.read ();
						var parser = new Json.Parser ();
						parser.load_from_stream (stream);
						Json.Node rootNode = parser.get_root ();
						try {
							unowned Json.Object obj = rootNode.get_object();
							unowned Json.Node mutationsRootNode = obj.get_member ("mutations");
							if (mutationsRootNode.get_node_type () != Json.NodeType.ARRAY) {
								throw new ParseError.INVALID_FORMAT ("Unexpected element type %s", mutationsRootNode.type_name ());
							}
							possibleMutations = parseMutationArray (mutationsRootNode.get_array ());
						} 
						catch (ParseError e) {
							stderr.printf(e.message);
						}
				} 
				catch (Error e) {
					stderr.printf("Unable to load file and parse");
				}
			}
			else {
				stderr.printf("Could not find resource file");
			}

			return possibleMutations; 
		}

		private HashMap<string, Mutation> parseMutationArray (Json.Array mutationsArray) throws Error {
			HashMap<string, Mutation> list = new HashMap<string, Mutation>();
			foreach (unowned Json.Node mutationNode in mutationsArray.get_elements ()) {
				Mutation mutation = Json.gobject_deserialize (typeof (Mutation), mutationNode) as Mutation;
				list.set (mutation.name, mutation);
			}
			return list;
		}
	}
}

//unowned Json.Array mutationsArray = mutationsRootNode.get_array ();
							//  StringBuilder builder = new StringBuilder ();
							//  foreach (Mutation possibleMutation in possibleMutations) {
							//    builder.append (possibleMutation.name);
							//    builder.append ("\n");
							//  }
							//  response = builder.str;      


				//  var root_object = parser.get_root ().get_object ();
				//  var response = root_object.get_object_member ("response");
				//  var results = response.get_array_member ("docs");
				//  int64 count = results.get_length ();
				//  int64 total = response.get_int_member ("numFound");
				//  stdout.printf ("got %lld out of %lld results:\n\n", count, total);

				//  foreach (var geonode in results.get_elements ()) {
				//      var geoname = geonode.get_object ();
				//      stdout.printf ("%s\n%s\n%f\n%f\n\n",
				//                    geoname.get_string_member ("name"),
				//                    geoname.get_string_member ("country_name"),
				//                    geoname.get_double_member ("lng"),
				//                    geoname.get_double_member ("lat"));
				//  }      
			
			
				//  StringBuilder builder = new StringBuilder ();


			
				//  try {
				//    var dis = new DataInputStream (resource.read ());
				//    string line;
				//    // Read lines until end of file (null) is reached
				//    while ((line = dis.read_line (null)) != null) {
				//      builder.append (line);
				//      builder.append ("\n");
				//    }
				//  } catch (Error e) {
				//    error ("%s", e.message);
				//  }
				//  response = builder.str;    

