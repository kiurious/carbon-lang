// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// RUN: %{explorer} %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes=false %s
// RUN: %{explorer} --parser_debug --trace_file=- %s 2>&1 | \
// RUN:   %{FileCheck} --match-full-lines --allow-unused-prefixes %s
// AUTOUPDATE: %{explorer} %s
// CHECK: Hello world!
// CHECK: result: 0

package ExplorerTest api;

// Return type is empty/void

fn AgeLogger(var age: i32) {
  if(age == 0){
   Print("Carbon is {0} years old", age);
  } else {
   Print("Carbon is not {0} years old", age);
  }
  var x: i32 = 0;
  while (x < 3) {
    Print("I am number {0}", x);
    x = x + 1;
  }
  Print("Done!");  
}

fn Looper() {
  var names: [String; 3] = ("one", "two", "three");
  var count : i32 = 0;
    for (name: auto in names) {
      Print(name);
    }
}

fn TheMatcher() -> String {
  Print("I am here");
  var x: i32 = 2;
  match (x) {
    case (0) => {
      return "Matching zero";
    }
    case (1) => {
      return "Matching one";
    }
    case (2) => {
      return "Matching two";
    }
    default => {
      return "Matching none";
    }
  }
}

fn Main() -> i32 {
  var s: auto = "Hello world!";
  Print(s);
  AgeLogger(0);
  Looper();
  TheMatcher();
  return 0;
}

