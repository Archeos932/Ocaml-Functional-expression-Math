open Lib

  (*file test to see if all is ok !! if you want to read the logic go in /lib *)

let () =
  let f =
    Ast.Add (
      Ast.Pow (Ast.Var "x", 2),
      Ast.Mul (Ast.Const 5, Ast.Var "x")
    )
  in

  let f_prime = Derive.derive f "x" in

  Printf.printf "f(x)  = %s\n" (Format.to_string f);
  Printf.printf "f'(x) = %s\n" (Format.to_string f_prime)
