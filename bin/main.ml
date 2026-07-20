open Lib

  (*file test to see if all is ok !! if you want to read the logic go in /lib *)

  let () =
    let f =
      Ast.Div (
        Ast.Sqrt (Ast.Sub (Ast.Pow (Ast.Var "x", 2), Ast.Const 4)),
        Ast.Sub (Ast.Mul (Ast.Const 3, Ast.Var "x"), Ast.Const 1)
      )
    in
    let f_prime = Derive.derive f "x" in
    let f_prime_simp = Simplify.simplify f_prime in

    Printf.printf "f(x)           = %s\n" (Format.to_string f);
    Printf.printf "f'(x) (brut)   = %s\n" (Format.to_string f_prime);
    Printf.printf "f'(x) (propre) = %s\n" (Format.to_string f_prime_simp)
