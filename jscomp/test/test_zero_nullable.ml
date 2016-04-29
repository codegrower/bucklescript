

module Test_null = struct 
let f1 x = 
  match Js.Null.to_opt x with 
  | None -> 
    let sum x y = x + y in 
    sum 1 2 
  | Some x -> 
    let sum x y = x + y in 
    sum x 1

let f2 x = 
  let u = Js.Null.to_opt x in
  match  u with 
  | None -> 
    let sum x y = x + y in 
    sum 1 2 
  | Some x -> 
    let sum x y = x + y in 
    sum x 1



let f5 h x = 
  let u = Js.Null.to_opt @@ h 32 in
  match  u with 
  | None -> 
    let sum x y = x + y in 
    sum 1 2
  | Some x -> 
    let sum x y = x + y in 
    sum x 1

let f4 h x = 
  let u = Js.Null.to_opt @@ h 32 in
  let v = 32 + x  in
  match  u with 
  | None -> 
    let sum x y = x + y in 
    sum 1 v
  | Some x -> 
    let sum x y = x + y in 
    sum x 1

let f6 x y = x == y

let f7 x = 
  match Some x with 
  | None -> None 
  | Some x -> x  

(* can [from_opt x ]  generate [Some None] which has type ['a Js.opt Js.opt] ?
   No, if [x] is [null] then None else [Some x]
*)
let f8 (x : 'a Js.Null.t Js.Null.t)= 
  match Js.Null.to_opt x with 
  | Some x ->
    (match Js.Null.to_opt x with 
    | Some _ -> 0
    | None -> 1 )
  | None -> 2 

let u = f8 (Js.Null.return (Js.Null.return None))

let f9 x = Js.Null.to_opt x 

let f10 x = Js.Null.test x 

let f11 =  (Js.Null.test @@ Js.Null.return 3)

end

module Test_def = struct 



  let f1 x = 
    match Js.Def.to_opt x with 
    | None -> 
      let sum x y = x + y in 
      sum 1 2 
    | Some x -> 
      let sum x y = x + y in 
      sum x 1

  let f2 x = 
    let u = Js.Def.to_opt x in
    match  u with 
    | None -> 
      let sum x y = x + y in 
      sum 1 2 
    | Some x -> 
      let sum x y = x + y in 
      sum x 1



  let f5 h x = 
    let u = Js.Def.to_opt @@ h 32 in
    match  u with 
    | None -> 
      let sum x y = x + y in 
      sum 1 2
    | Some x -> 
      let sum x y = x + y in 
      sum x 1

  let f4 h x = 
    let u = Js.Def.to_opt @@ h 32 in
    let v = 32 + x  in
    match  u with 
    | None -> 
      let sum x y = x + y in 
      sum 1 v
    | Some x -> 
      let sum x y = x + y in 
      sum x 1

  let f6 x y = x == y

  let f7 x = 
    match Some x with 
    | None -> None 
    | Some x -> x  

  (* can [from_def x ]  generate [Some None] which has type ['a Js.opt Js.opt] ?
     No, if [x] is [null] then None else [Some x]
  *)
  let f8 x = 
    match Js.Def.to_opt x with 
    | Some x ->
      (match Js.Def.to_opt x with 
       | Some _ -> 0
       | None -> 1 )
    | None -> 2 

  let u = f8 (Js.Def.return (Js.Def.return None))

  let f9 x = Js.Def.to_opt x 

  let f10 x = Js.Def.test x 
  let f11 = Js.Def.test (Js.Def.return 3 )
end


module Test_null_def = struct 
  open Js.Null_def
  let f1 x = 
    match to_opt x with 
    | None -> 
      let sum x y = x + y in 
      sum 1 2 
    | Some x -> 
      let sum x y = x + y in 
      sum x 1

  let f2 x = 
    let u = to_opt x in
    match  u with 
    | None -> 
      let sum x y = x + y in 
      sum 1 2 
    | Some x -> 
      let sum x y = x + y in 
      sum x 1



  let f5 h x = 
    let u = to_opt @@ h 32 in
    match  u with 
    | None -> 
      let sum x y = x + y in 
      sum 1 2
    | Some x -> 
      let sum x y = x + y in 
      sum x 1

  let f4 h x = 
    let u = to_opt @@ h 32 in
    let v = 32 + x  in
    match  u with 
    | None -> 
      let sum x y = x + y in 
      sum 1 v
    | Some x -> 
      let sum x y = x + y in 
      sum x 1

  let f6 x y = x == y

  let f7 x = 
    match Some x with 
    | None -> None 
    | Some x -> x  

  (* can [from_opt x ]  generate [Some None] which has type ['a Js.opt Js.opt] ?
     No, if [x] is [null] then None else [Some x]
  *)
  let f8 (x : 'a t t)= 
    match to_opt x with 
    | Some x ->
      (match to_opt x with 
       | Some _ -> 0
       | None -> 1 )
    | None -> 2 

  let u = f8 (return (return None))

  let f9 x = to_opt x 

  let f10 x = test x 

  let f11 =  (test @@ return 3)

end