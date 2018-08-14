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

public class DiceTests : AbstractTestCase {

  RPGCore.Dice d;

  public DiceTests () {
    base ("Dice") ;
    add_test ("Roll 1 to 6", test_roll_1to6) ;
    add_test ("Roll 1 to 8", test_roll_1to8) ;
    add_test ("Roll 1 to 100", test_roll_1to100) ;
    add_test ("Roll 1 to 6 Three Times", test_roll_1to6_3_times) ;
    add_test ("Roll 1d3 ", test_roll_1d3) ;
    add_test ("Roll 1d4 ", test_roll_1d4) ;
    add_test ("Roll 1d6 ", test_roll_1d6) ;
    add_test ("Roll 3d6 ", test_roll_3d6) ;
    add_test ("Roll 1d10 ", test_roll_1d10) ;
    add_test ("Roll 1d12 ", test_roll_1d12) ;
    add_test ("Roll 1d20 ", test_roll_1d20) ;    
    add_test ("Roll 4d6 And Drop Lowest ", test_roll_4d6_droplowest) ;    
    add_test ("Display Results ", test_fail_to_display) ;    
  }

  public override void set_up() {
    d = new RPGCore.Dice();
  }
  
  public override void tear_down() {
    d = null;
  }

  public virtual void test_roll_1to6() {
    int result = d.roll_range(1, 6, 1, false);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 6));
  }

  public virtual void test_roll_1to8() {
    int result = d.roll_range(1, 8, 1, false);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 8));
  }  

  public virtual void test_roll_1to6_3_times() {
    int result = d.roll_range(1, 6, 3, false);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 3) && (result <= 18));
  } 

  public virtual void test_roll_1to100() {
    int result = d.roll_range(1, 100, 1, false);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 100));
  } 

  public virtual void test_roll_3d6() {
    int result = d.roll_dicetype(DiceType.d6, 3);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 3) && (result <= 18));
  } 

  public virtual void test_roll_1d3() {
    int result = d.roll_dicetype(DiceType.d3, 1);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 3));
  } 

  public virtual void test_roll_1d4() {
    int result = d.roll_dicetype(DiceType.d4, 1);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 4));
  } 

  public virtual void test_roll_1d6() {
    int result = d.roll_dicetype(DiceType.d6, 1);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 6));
  } 

  public virtual void test_roll_1d8() {
    int result = d.roll_dicetype(DiceType.d8, 1);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 8));
  } 
  
  public virtual void test_roll_1d10() {
    int result = d.roll_dicetype(DiceType.d10, 1);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 10));
  } 
  
  public virtual void test_roll_1d12() {
    int result = d.roll_dicetype(DiceType.d12, 1);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 12));
  }   

  public virtual void test_roll_1d20() {
    int result = d.roll_dicetype(DiceType.d20, 1);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 1) && (result <= 20));
  } 

  public virtual void test_roll_4d6_droplowest() {
    int result = d.roll_dicetype(DiceType.d6, 4, true);
    stdout.printf ("Total = %d ", result);
    assert ((result >= 3) && (result <= 18));
  } 

  public virtual void test_fail_to_display() {
    assert (true == false);
  } 
}