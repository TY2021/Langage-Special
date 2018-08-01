(* unify : (ty * ty) list -> tysubst *)
let unify eql =
  let rec solve eql theta =
    match eql with
      | [] -> theta
      | (t1,t2):: eql2 ->
	  if t1 = t2 then solve eql2 theta
	  else
           begin
            match (t1,t2) with
	    | (TArrow(t11,t12),TArrow(t21,t22))
	      -> solve ((t11,t21)::(t12,t22)::eql2) theta
	    | (TVar(s), _)
	      -> if (occurs t1 t2) then failwith "unification failed"
	      else solve (subst_eql [(s,t2)] eql2)
	                 (compose_subst [(s,t2)] theta)
	    | (_,TVar(s))
	      -> if (occurs t2 t1) then failwith "unification failed"
	      else solve (subst_eql [(s,t1)] eql2)
	                 (compose_subst [(s,t1)] theta)
	    | (_,_) -> failwith "unification failed"
            end
  in solve eql []

fun Unify()
  E = ();
