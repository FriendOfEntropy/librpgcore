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

public class MutationGeneratorTests : AbstractTestCase {

  RPGCore.MutationGenerator m;

  public MutationGeneratorTests () {
    base ("MutationGenerator") ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get Beneficial Mutation", test_get_beneficial_mutation) ;
    add_test ("Get 1 Points of Mutations", test_get_mutations_cost_constrained_1) ;
    add_test ("Get 2 Points of Mutations", test_get_mutations_cost_constrained_2) ;
    add_test ("Get 3 Points of Mutations", test_get_mutations_cost_constrained_3) ;
    add_test ("Get 4 Points of Mutations", test_get_mutations_cost_constrained_4) ;
    add_test ("Get 5 Points of Mutations", test_get_mutations_cost_constrained_5) ;
    add_test ("Get 6 Points of Mutations", test_get_mutations_cost_constrained_6) ;    
    add_test ("This line to force display ", test_fail_to_display) ;    
  }

  public override void set_up() {
    m = new RPGCore.MutationGenerator();
  }
  
  public override void tear_down() {
    m = null;
  }

  public virtual void test_get_beneficial_mutation() {
    Mutation rolledMutation = m.get_beneficialmutation();
    stdout.printf (rolledMutation.name + " ") ;
    assert (rolledMutation != null);
  }

  public virtual void test_get_mutations_cost_constrained_1() {
    int allowedPoints = 1;
    HashMap<string, Mutation> list = m.get_random_mutations_cost_constrained(allowedPoints);
    StringBuilder builder = new StringBuilder();
    int totalPoints = 0;
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
      totalPoints += mut.mp;
    }
    stdout.printf (builder.str) ;
    assert (totalPoints == allowedPoints);
  }

  public virtual void test_get_mutations_cost_constrained_2() {
    int allowedPoints = 2;
    HashMap<string, Mutation> list = m.get_random_mutations_cost_constrained(allowedPoints);
    StringBuilder builder = new StringBuilder();
    int totalPoints = 0;
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
      totalPoints += mut.mp;
    }
    stdout.printf (builder.str) ;
    assert (totalPoints == allowedPoints);
  }

  public virtual void test_get_mutations_cost_constrained_3() {
    int allowedPoints = 3;
    HashMap<string, Mutation> list = m.get_random_mutations_cost_constrained(allowedPoints);
    StringBuilder builder = new StringBuilder();
    int totalPoints = 0;
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
      totalPoints += mut.mp;
    }
    stdout.printf (builder.str) ;
    assert (totalPoints == allowedPoints);
  }

  public virtual void test_get_mutations_cost_constrained_4() {
    int allowedPoints = 4;
    HashMap<string, Mutation> list = m.get_random_mutations_cost_constrained(allowedPoints);
    StringBuilder builder = new StringBuilder();
    int totalPoints = 0;
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
      totalPoints += mut.mp;
    }
    stdout.printf (builder.str) ;
    assert (totalPoints == allowedPoints);
  }

  public virtual void test_get_mutations_cost_constrained_5() {
    int allowedPoints = 5;
    HashMap<string, Mutation> list = m.get_random_mutations_cost_constrained(allowedPoints);
    StringBuilder builder = new StringBuilder();
    int totalPoints = 0;
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
      totalPoints += mut.mp;
    }
    stdout.printf (builder.str) ;
    assert (totalPoints == allowedPoints);
  }

  public virtual void test_get_mutations_cost_constrained_6() {
    int allowedPoints = 6;
    HashMap<string, Mutation> list = m.get_random_mutations_cost_constrained(allowedPoints);
    StringBuilder builder = new StringBuilder();
    int totalPoints = 0;
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
      totalPoints += mut.mp;
    }
    stdout.printf (builder.str) ;
    assert (totalPoints == allowedPoints);
  }

  public virtual void test_fail_to_display() {
    assert (true == false);
  } 
}