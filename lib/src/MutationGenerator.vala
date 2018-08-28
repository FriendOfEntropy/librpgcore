
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

  public enum MutationType
  {
    BENEFICIAL = 0,
    DEFECT = 1;

    public string to_string ()
    {
      return ((EnumClass) typeof (MutationType).class_ref ()).get_value (this).value_name;
    }

  }

	/// <summary>
	/// 
	/// </summary>
	public class MutationGenerator : GLib.Object
	{
		public MutationGenerator()
		{
		}
		
		public HashMap<string, Mutation> get_random_mutations(MutationType mutation_type, int number_of_mutations) {
			HashMap<string, Mutation> possibleMutations = get_possible_mutations(mutation_type);

			int maxRoll = (mutation_type == MutationType.BENEFICIAL) ? 128 : 122;

			HashMap<string, Mutation> rolledMutations = new HashMap<string, Mutation>();
			Dice d = new Dice();

			for (int i = 1; i <= number_of_mutations; i++) { 
				Mutation m = get_mutation(possibleMutations, maxRoll);
				if (rolledMutations.has_key (m.name)) {
					i--;   //reroll any duplicates for now...maybe dup logic in future
				}
				else {
					rolledMutations.set (m.name, m);
				}
			}

			return rolledMutations;
		}


		public Mutation get_mutation(HashMap<string, Mutation> possible_mutations, int max_roll) {
			Mutation response = null;
		
			Dice d = new Dice();
			int result = d.roll_range(1, max_roll, 1, false);

			foreach (var entry in possible_mutations.entries) {
				Mutation mut = entry.value;
				if ((result >= mut.from) && (result <= mut.to)) {
					response = mut;
					break;
				}
			}
			d = null;
			return response;
		}

		public HashMap<string, Mutation> get_possible_mutations(MutationType mutation_type) {
			string resourceFileToLoad;
			string resourceArrayName;

			if (mutation_type == MutationType.BENEFICIAL) {
				resourceFileToLoad = "resource:///data/ogl/MutationsBeneficial.json";
				resourceArrayName = "mutations";
			}
			else {
				resourceFileToLoad = "resource:///data/ogl/MutationsDefects.json";
				resourceArrayName = "defects";
			}
			
			HashMap<string, Mutation> possibleMutations = new HashMap<string, Mutation>();
			File jsonFile;
			jsonFile = File.new_for_uri (resourceFileToLoad);
			if (jsonFile.query_exists ()) {
				try {
						FileInputStream stream = jsonFile.read ();
						var parser = new Json.Parser ();
						parser.load_from_stream (stream);
						Json.Node rootNode = parser.get_root ();
						try {
							unowned Json.Object obj = rootNode.get_object();
							unowned Json.Node mutationsRootNode = obj.get_member (resourceArrayName);
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
