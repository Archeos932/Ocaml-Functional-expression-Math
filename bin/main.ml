open Lib

  (*file test to see if all is ok !! if you want to read the logic go in /lib *)

let () =
  let f =
    Ast.Add (
      Ast.Mul (Ast.Const 4, Ast.Pow (Ast.Var "x", 5)),
      Ast.Mul (
        Ast.Pow (Ast.Add (Ast.Pow (Ast.Var "x", 2), Ast.Const 3), 3),
        Ast.Pow (Ast.Add (Ast.Mul (Ast.Const 2, Ast.Var "x"), Ast.Const 1), 2)
      )
    )
  in
  let f_prime = Simplify.simplify ( Derive.derive f "x" )in

  Printf.printf "f(x)  = %s\n" (Format.to_string f);
  Printf.printf "f'(x) = %s\n" (Format.to_string f_prime)
