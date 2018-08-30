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
    add_test ("Get Defect Mutation", test_get_defect_mutation) ;    
    add_test ("Get 1 Mutations", test_get_random_mutations_1) ;
    add_test ("Get 2 Mutations", test_get_random_mutations_2) ;
    add_test ("Get 3 Mutations", test_get_random_mutations_3) ;
    add_test ("Get 4 Mutations", test_get_random_mutations_4) ;
    add_test ("Get 5 Mutations", test_get_random_mutations_5) ;
    add_test ("Get 6 Mutations", test_get_random_mutations_6) ;
    //add_test ("This line to force display ", test_fail_to_display) ;    
  }

  public override void set_up() {
    m = new RPGCore.MutationGenerator();
  }
  
  public override void tear_down() {
    m = null;
  }

  public virtual void test_get_beneficial_mutation() {
    HashMap<string, Mutation> list = m.get_possible_mutations(MutationType.BENEFICIAL); 
    Mutation rolledMutation = m.get_mutation(list, 128);
    stdout.printf (rolledMutation.name + " ") ;
    assert (rolledMutation != null);
  }

  public virtual void test_get_defect_mutation() {
    HashMap<string, Mutation> list = m.get_possible_mutations(MutationType.DEFECT); 
    Mutation rolledMutation = m.get_mutation(list, 122);
    stdout.printf (rolledMutation.name + " ") ;
    assert (rolledMutation != null);
  }

  public virtual void test_get_random_mutations_1() {
    int numberOfMutations = 1;
    HashMap<string, Mutation> list = m.get_random_mutations(MutationType.BENEFICIAL, numberOfMutations);
    StringBuilder builder = new StringBuilder();
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
    }
    stdout.printf (builder.str) ;
    assert (list.size == numberOfMutations);
  }

  public virtual void test_get_random_mutations_2() {
    int numberOfMutations = 2;
    HashMap<string, Mutation> list = m.get_random_mutations(MutationType.BENEFICIAL, numberOfMutations);
    StringBuilder builder = new StringBuilder();
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
    }
    stdout.printf (builder.str) ;
    assert (list.size == numberOfMutations);
  }

  public virtual void test_get_random_mutations_3() {
    int numberOfMutations = 3;
    HashMap<string, Mutation> list = m.get_random_mutations(MutationType.BENEFICIAL, numberOfMutations);
    StringBuilder builder = new StringBuilder();
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
    }
    stdout.printf (builder.str) ;
    assert (list.size == numberOfMutations);
  }

  public virtual void test_get_random_mutations_4() {
    int numberOfMutations = 4;
    HashMap<string, Mutation> list = m.get_random_mutations(MutationType.BENEFICIAL, numberOfMutations);
    StringBuilder builder = new StringBuilder();
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
    }
    stdout.printf (builder.str) ;
    assert (list.size == numberOfMutations);
  }

  public virtual void test_get_random_mutations_5() {
    int numberOfMutations = 5;
    HashMap<string, Mutation> list = m.get_random_mutations(MutationType.BENEFICIAL, numberOfMutations);
    StringBuilder builder = new StringBuilder();
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
    }
    stdout.printf (builder.str) ;
    assert (list.size == numberOfMutations);
  }

  public virtual void test_get_random_mutations_6() {
    int numberOfMutations = 6;
    HashMap<string, Mutation> list = m.get_random_mutations(MutationType.BENEFICIAL, numberOfMutations);
    StringBuilder builder = new StringBuilder();
    foreach (var entry in list.entries) {
      Mutation mut = entry.value;
      builder.append(mut.name + ", ");
    }
    stdout.printf (builder.str) ;
    assert (list.size == numberOfMutations);
  }

  public virtual void test_fail_to_display() {
    assert (true == false);
  } 
}