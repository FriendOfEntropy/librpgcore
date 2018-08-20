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

public class AbilityTests : AbstractTestCase {

  public AbilityTests () {
    base ("Ability") ;
    add_test ("Test To String", test_to_string_1) ;
    add_test ("Test To String", test_to_string_2) ;
    add_test ("Test To String", test_to_string_3) ;
    add_test ("Test To String", test_to_string_4) ;
    add_test ("Test To String", test_to_string_5) ;
    add_test ("Test To String", test_to_string_6) ;
    add_test ("Test To String", test_to_string_7) ;
    //add_test ("This line to force display ", test_fail_to_display) ;    
  }

  public override void set_up() {

  }
  
  public override void tear_down() {
    
  }

  public virtual void test_to_string_1() {
    RPGCore.Ability a = new RPGCore.Ability("Strength", "STR");
    a.score = 12;
    string displayString = a.to_string();
    stdout.printf (displayString + " ") ;
    assert (displayString == "    Strength: 12  ( 1)");
    a = null;
  }

  public virtual void test_to_string_2() {
    RPGCore.Ability a = new RPGCore.Ability("Dexterity", "DEX");
    a.score = 6;
    string displayString = a.to_string();
    stdout.printf (displayString + " ") ;
    assert (displayString == "   Dexterity:  6  (-2)");
    a = null;
  }  
  
  public virtual void test_to_string_3() {
    RPGCore.Ability a = new RPGCore.Ability("Constitution", "CON");
    a.score = 16;
    string displayString = a.to_string();
    stdout.printf (displayString + " ") ;
    assert (displayString == "Constitution: 16  ( 3)");
    a = null;
  }  

  public virtual void test_to_string_4() {
    RPGCore.Ability a = new RPGCore.Ability("Intelligence", "INT");
    a.score = 19;
    string displayString = a.to_string();
    stdout.printf (displayString + " ") ;
    assert (displayString == "Intelligence: 19  ( 4)");
    a = null;
  }  

  public virtual void test_to_string_5() {
    RPGCore.Ability a = new RPGCore.Ability("Wisdom", "WIS");
    a.score = 3;
    string displayString = a.to_string();
    stdout.printf (displayString + " ") ;
    assert (displayString == "      Wisdom:  3  (-4)");
    a = null;
  }  
  
  public virtual void test_to_string_6() {
    RPGCore.Ability a = new RPGCore.Ability("Charisma", "CHA");
    a.score = 13;
    string displayString = a.to_string();
    stdout.printf (displayString + " ") ;
    assert (displayString == "    Charisma: 13  ( 1)");
    a = null;
  }    

  public virtual void test_to_string_7() {
    RPGCore.Ability a = new RPGCore.Ability("TooLongAbility", "TLA");
    a.score = 20;
    string displayString = a.to_string();
    stdout.printf (displayString + " ") ;
    assert (displayString == "oLongAbility: 20  ( 5)");
    a = null;
  }      

  public virtual void test_fail_to_display() {
    assert (true == false);
  } 
}