type expr =
  | Const of int
  | Var of string
  | Add of expr * expr
  | Mul of expr * expr
  | Pow of expr * int
