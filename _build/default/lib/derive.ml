open Ast

let rec derive (exp : Ast.expr) (var_name : string) : Ast.expr =
  match exp with
    | Const _ -> Const 0
    | Var x -> if x = var_name then Const 1 else Const 0
    | Add (e1, e2) -> Add (derive e1 var_name, derive e2 var_name)
    | Sub (e1, e2) -> Sub (derive e1 var_name, derive e2 var_name)
    | Mul (e1, e2) -> Add (Mul (derive e1 var_name, e2), Mul (e1, derive e2 var_name))
    | Div (e1, e2) -> Div ( Sub(Mul(derive e1 var_name , e2) , Mul(e1, derive e2 var_name) ) , Pow( e2, 2))
    | Pow (e1, n) -> Mul (Const n, Mul (derive e1 var_name, Pow (e1, n - 1)))
    | Sqrt (e1) -> Div (derive e1 var_name, Mul(Const 2, Sqrt(e1)))
