open Lib

  (*file test to see if all is ok !! if you want to read the logic go in /lib *)


  let () =
    (* f(x) = 4 * x^3 + 2 * x *)
    let f =
      Ast.Add (
        Ast.Mul (Ast.Const 4, Ast.Pow (Ast.Var "x", 3)),
        Ast.Mul (Ast.Const 2, Ast.Var "x")
      )
    in

    (* Calculs avec simplification directe *)
    let f_prime = Simplify.simplify (Derive.derive f "x") in
    let big_f = Simplify.simplify (Primitive.primitive f "x") in
    let x_val = 5.0 in
    let eval = Eval.eval big_f x_val in

    (* Affichage *)
    Printf.printf "f(x)  = %s\n" (Format.to_string f);
    Printf.printf "f'(x) = %s\n" (Format.to_string f_prime);
    Printf.printf "F(x)  = %s\n" (Format.to_string big_f) ;
    Printf.printf " evaluation de la primitive en %f = %f " x_val  eval
