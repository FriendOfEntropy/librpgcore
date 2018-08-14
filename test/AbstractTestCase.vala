// Adapted from  http://esite.ch/2012/06/26/writing-tests-for-vala/
 
public abstract class AbstractTestCase : Object {

  private GLib.TestSuite suite ;
  private Adapter[] adapters = new Adapter[0] ;

  public delegate void TestMethod() ;

  public AbstractTestCase (string name) {
    this.suite = new GLib.TestSuite (name) ;
  }

  public void add_test(string name, owned TestMethod test) {
    var adapter = new Adapter (name, (owned) test, this) ;
    this.adapters += adapter ;

    this.suite.add (
      new GLib.TestCase (adapter.name, adapter.set_up, adapter.run, adapter.tear_down)
    ) ;
  }

  public virtual void set_up() {
  }

  public virtual void tear_down() {
  }

  public GLib.TestSuite get_suite() {
    return this.suite ;
  }

  private class Adapter {
    public string name { get ; private set ; }
    private TestMethod test ;
    private AbstractTestCase test_case ;

    public Adapter (string name, owned TestMethod test, AbstractTestCase test_case) {
      this.name = name ;
      this.test = (owned) test ;
      this.test_case = test_case ;
    }

    public void set_up(void * fixture) {
     this.test_case.set_up () ;
    }

    public void run(void * fixture) {
     this.test () ;
    }

    public void tear_down(void * fixture) {
      this.test_case.tear_down () ;
    }
  }
}