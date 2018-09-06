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

public class CharacterGeneratorTests : AbstractTestCase {

  RPGCore.CharacterGenerator g;

  public CharacterGeneratorTests () {
    base ("CharacterGenerator") ;
    add_test ("Test Random Character", test_chargen_1) ;
    add_test ("Test Random Character", test_chargen_1) ;
    add_test ("Test Random Character", test_chargen_1) ;
    add_test ("Test Random Character", test_chargen_1) ;
    add_test ("Test Random Character", test_chargen_1) ;
    add_test ("Test Random Character", test_chargen_1) ;
    add_test ("Test Random Character", test_chargen_1) ;
    //add_test ("This line to force display ", test_fail_to_display) ;
  }

  public override void set_up() {
    g = new RPGCore.CharacterGenerator();
  }

  public override void tear_down() {
    g = null;
  }

  public virtual void test_chargen_1() {
    Character c = g.generate_random_character();
    stdout.printf ( "\n"  + c.to_json () + "\n" );
    assert (c.abilities.size == 6);
    c = null;
  }

  public virtual void test_fail_to_display() {
    assert (true == false);
  }
}