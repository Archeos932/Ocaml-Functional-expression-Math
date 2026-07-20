type expr =
  | Const of int
  | Var of string
  | Add of expr * expr
  | Mul of expr * expr
  | Pow of expr * int
  | Sub of expr * expr
  | Div of expr * expr
  | Sqrt of expr
