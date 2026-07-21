open Ast

let rec primitive ( exp : Ast.expr) (var_name : string) : Ast.expr =
  match exp with
    | Const 0 -> Const 0
    | Const c -> Mul(Const c, Var var_name)
    | Var x -> if x = var_name then Div (Pow (Var var_name, 2), Const 2) else Mul(Var x, Var var_name)
    | Add (e1, e2) -> Add(primitive e1 var_name, primitive e2 var_name)
    | Sub (e1, e2) -> Sub(primitive e1 var_name, primitive e2 var_name)
    | Mul (Const x, e1) | Mul (e1, Const x) -> Mul( Const x, primitive e1 var_name)
    | Pow (Var x, n ) when x = var_name ->
      if n = -1 then failwith "Primitive ln(x) pas encore implementer"
      else Div (Pow(Var x , n+1), Const (n + 1))
    | _ -> failwith "forme trop complexe pour resoudre pour le moment "
