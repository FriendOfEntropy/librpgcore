public class Mutation : GLib.Object {
  public int from { get; set; }
  public int to { get; set; }
  public string name { get; set; }
  public string category { get; set; }
  public string desc { get; set; }
  public string benefit { get; set; }
  public string special { get; set; }
  public int mp { get; set; }

  public Mutation() {
  }

}