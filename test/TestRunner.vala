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


void main(string[] args) {
  Test.init (ref args) ;

  TestSuite.get_root ().add_suite (new DiceTests ().get_suite ()) ;
  TestSuite.get_root ().add_suite (new MutationGeneratorTests ().get_suite ()) ;
  TestSuite.get_root ().add_suite (new AbilityTests ().get_suite ()) ;
  TestSuite.get_root ().add_suite (new AbilityGeneratorTests ().get_suite ()) ;
  TestSuite.get_root ().add_suite (new CharacterGeneratorTests ().get_suite ()) ;

  Test.run () ;
}