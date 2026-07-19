open Ast

let rec to_string (exp: Ast.expr) : string = match exp with
  | Var x -> x
  | Const x -> string_of_int x
  | Add (e1, e2) -> "(" ^ to_string e1 ^ "+" ^ to_string e2 ^ ")"
  | Mul (e1, e2) -> "(" ^ to_string e1 ^ "*" ^ to_string e2 ^ ")"
  | Pow (e1, n) -> "(" ^ to_string e1 ^ "^" ^ string_of_int n ^ ")"
