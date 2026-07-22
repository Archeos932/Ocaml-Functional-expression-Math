open Ast

let rec eval (exp : Ast.expr) (x_val : float) : float =
  match exp with
    | Var _ -> x_val
    | Const n -> float_of_int n
    | Add (e1, e2) -> (eval e1 x_val) +. (eval e2 x_val)
    | Sub (e1, e2) -> (eval e1 x_val) -. (eval e2 x_val)
    | Mul (e1, e2) -> (eval e1 x_val) *. (eval e2 x_val)
    | Div (e1, e2) -> (eval e1 x_val) /. (eval e2 x_val)
    | Pow (e1, n ) -> (eval e1 x_val) ** float_of_int n
    | Sqrt(e) -> sqrt(eval e x_val)
