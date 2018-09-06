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

namespace RPGCore {

  public class Ability : GLib.Object {
    public int score { get; set; }
    public string name { get; set; }
    public string abbreviation { get; set; }
    public string desc { get; set; }

    public int modifier {
      get {
        return (score / 2) -5;
      }
    }

    public Ability(string name, string abbreviation) {
      this.name = name;
      this.abbreviation = abbreviation;
    }

    public string to_string()
    {
      string paddedName = (string.nfill(12, ' ') + name);
      string paddedScore = string.nfill(2, ' ') + score.to_string();
      string trimmedName = paddedName.substring(paddedName.char_count() - 12, 12);
      string trimmedScore = paddedScore.substring(paddedScore.char_count() - 2, 2);
      return trimmedName  + ": " + trimmedScore + "  (% d)".printf(modifier);
    }
  }
}