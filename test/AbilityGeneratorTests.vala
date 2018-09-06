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