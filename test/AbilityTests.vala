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