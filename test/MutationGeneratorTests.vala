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