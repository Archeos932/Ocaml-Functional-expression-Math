open Ast

let rec simplify (exp : Ast.expr) : Ast.expr =  match exp with
  | Const _ | Var _ -> exp
  | Add (e1, e2) ->
    (match (simplify e1, simplify e2) with
      | Const 0, x | x ,Const 0 -> x
      | Const a, Const b -> Const (a + b)
      | s1 , s2 -> Add(s1, s2)
    )
  |Mul (e1, e2) ->
    (match (simplify e1, simplify e2) with
      |Const 0, _ | _, Const 0 -> Const 0
      | Const 1, x | x, Const 1 -> x
      |Const a, Const b -> Const (a * b)
      | s1, s2 -> Mul (s1, s2)
    )
  | Pow (e1, n) ->
      (match simplify e1 with
      | _ when n = 0 -> Const 1
      | _ when n = 1 -> e1
      | s1 -> Pow (s1, n))
