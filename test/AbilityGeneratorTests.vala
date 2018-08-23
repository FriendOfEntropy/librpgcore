/* MIT License

Copyright (c) 2018 FriendOfEntropy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

using RPGCore;
using Gee;

public class AbilityGeneratorTests : AbstractTestCase {

  RPGCore.AbilityGenerator g;

  public AbilityGeneratorTests () {
    base ("AbilityGenerator") ;
    add_test ("Test Random Stat Block", test_statblock_1) ;
    add_test ("Test Random Stat Block", test_statblock_1) ;
    add_test ("Test Random Stat Block", test_statblock_1) ;
    add_test ("Test Random Stat Block", test_statblock_1) ;
    add_test ("Test Random Stat Block", test_statblock_1) ;
    add_test ("Test Random Stat Block", test_statblock_1) ;
    add_test ("Test Random Stat Block", test_statblock_1) ;
    //add_test ("This line to force display ", test_fail_to_display) ;    
  }

  public override void set_up() {
    g = new RPGCore.AbilityGenerator();
  }
  
  public override void tear_down() {
    g = null;
  }

  public virtual void test_statblock_1() {
    HashMap<string, Ability> a = g.get_random_abilities();
    
    StringBuilder builder = new StringBuilder();
    Ability ability = a.get("STR");
    builder.append(ability.to_string() + "\n");

    ability = a.get("DEX");
    builder.append(ability.to_string() + "\n");

    ability = a.get("CON");
    builder.append(ability.to_string() + "\n");

    ability = a.get("INT");
    builder.append(ability.to_string() + "\n");

    ability = a.get("WIS");
    builder.append(ability.to_string() + "\n");

    ability = a.get("CHA");
    builder.append(ability.to_string() + "\n");

    stdout.printf ("\n" + builder.str);
    assert (a.size == 6);
    a = null;
  }

  public virtual void test_fail_to_display() {
    assert (true == false);
  } 
}