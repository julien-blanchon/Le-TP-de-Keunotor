
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | STARTS
    | STARTED
    | RIGHT_BRACE
    | RESOURCE
    | PROCESS
    | NUMBER of (
# 15 "parserProcessus.mly"
       (int)
# 16 "parserProcessus.ml"
  )
    | LEFT_BRACE
    | IF
    | IDENTIFIER of (
# 16 "parserProcessus.mly"
       (string)
# 23 "parserProcessus.ml"
  )
    | FINISHES
    | FINISHED
    | END
    | AMOUNT
    | ACTIVITY
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState24
  | MenhirState13
  | MenhirState9
  | MenhirState3

# 1 "parserProcessus.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 59 "parserProcessus.ml"

let rec _menhir_goto_etat : _menhir_env -> 'ttv_tail -> 'tv_etat -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_action)) * (
# 16 "parserProcessus.mly"
       (string)
# 67 "parserProcessus.ml"
    )) = Obj.magic _menhir_stack in
    let (_v : 'tv_etat) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv119 * _menhir_state * 'tv_action)) * (
# 16 "parserProcessus.mly"
       (string)
# 74 "parserProcessus.ml"
    )) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_etat) : 'tv_etat) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_action)), (_3 : (
# 16 "parserProcessus.mly"
       (string)
# 80 "parserProcessus.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_contrainte = 
# 45 "parserProcessus.mly"
                                       ( (print_endline "contrainte : action if IDENTIFIER etat") )
# 86 "parserProcessus.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv117) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_contrainte) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv115 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FINISHES ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | STARTS ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ACTIVITY | RESOURCE | RIGHT_BRACE ->
        _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv116)) : 'freshtv118)) : 'freshtv120)) : 'freshtv122)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_contraintes : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_contraintes -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 122 "parserProcessus.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_contraintes) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 130 "parserProcessus.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_contraintes) : 'tv_contraintes) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 16 "parserProcessus.mly"
       (string)
# 137 "parserProcessus.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_activite = 
# 40 "parserProcessus.mly"
                                           ( (print_endline "activite : activity IDENTIFIER contraintes") )
# 143 "parserProcessus.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_activite) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_activite) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_activite) : 'tv_activite) = _v in
        ((let _v : 'tv_element = 
# 35 "parserProcessus.mly"
                   ( (print_endline "element : activite") )
# 160 "parserProcessus.ml"
         in
        _menhir_goto_element _menhir_env _menhir_stack _menhir_s _v) : 'freshtv102)) : 'freshtv104)) : 'freshtv106)) : 'freshtv108)) : 'freshtv110)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_contraintes) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_contraintes) : 'tv_contraintes) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_contrainte)) = _menhir_stack in
        let _v : 'tv_contraintes = 
# 43 "parserProcessus.mly"
                                       ( (print_endline "contraintes : contrainte contraintes") )
# 176 "parserProcessus.ml"
         in
        _menhir_goto_contraintes _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)) : 'freshtv114)
    | _ ->
        _menhir_fail ()

and _menhir_goto_action : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_action -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv99 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENTIFIER _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv91 * _menhir_state * 'tv_action)) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 202 "parserProcessus.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FINISHED ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv81) = Obj.magic _menhir_stack in
                ((let _1 = () in
                let _v : 'tv_etat = 
# 51 "parserProcessus.mly"
                    ( (print_endline "etat : FINISHED") )
# 218 "parserProcessus.ml"
                 in
                _menhir_goto_etat _menhir_env _menhir_stack _v) : 'freshtv82)) : 'freshtv84)
            | STARTED ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
                ((let _1 = () in
                let _v : 'tv_etat = 
# 50 "parserProcessus.mly"
               ( (print_endline "etat : STARTED") )
# 231 "parserProcessus.ml"
                 in
                _menhir_goto_etat _menhir_env _menhir_stack _v) : 'freshtv86)) : 'freshtv88)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv89 * _menhir_state * 'tv_action)) * (
# 16 "parserProcessus.mly"
       (string)
# 241 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)) : 'freshtv92)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv93 * _menhir_state * 'tv_action)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)) : 'freshtv96)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)

and _menhir_goto_elements : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_elements -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75) * (
# 16 "parserProcessus.mly"
       (string)
# 269 "parserProcessus.ml"
        ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RIGHT_BRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv71) * (
# 16 "parserProcessus.mly"
       (string)
# 279 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv69) * (
# 16 "parserProcessus.mly"
       (string)
# 286 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_2 : (
# 16 "parserProcessus.mly"
       (string)
# 291 "parserProcessus.ml"
            ))), _, (_4 : 'tv_elements)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_processus = 
# 30 "parserProcessus.mly"
                                                               ( (print_endline "processus : process IDENTIFIER { elements }") )
# 299 "parserProcessus.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv67) = _menhir_stack in
            let (_v : 'tv_processus) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv65 * 'tv_processus) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv61 * 'tv_processus) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv59 * 'tv_processus) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, (_1 : 'tv_processus)) = _menhir_stack in
                let _2 = () in
                let _v : (
# 21 "parserProcessus.mly"
      (unit)
# 320 "parserProcessus.ml"
                ) = 
# 28 "parserProcessus.mly"
                        ( (print_endline "fichier : processus END") )
# 324 "parserProcessus.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv57) = _menhir_stack in
                let (_v : (
# 21 "parserProcessus.mly"
      (unit)
# 331 "parserProcessus.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
                let (_v : (
# 21 "parserProcessus.mly"
      (unit)
# 338 "parserProcessus.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv53) = Obj.magic _menhir_stack in
                let ((_1 : (
# 21 "parserProcessus.mly"
      (unit)
# 345 "parserProcessus.ml"
                )) : (
# 21 "parserProcessus.mly"
      (unit)
# 349 "parserProcessus.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv54)) : 'freshtv56)) : 'freshtv58)) : 'freshtv60)) : 'freshtv62)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv63 * 'tv_processus) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv64)) : 'freshtv66)) : 'freshtv68)) : 'freshtv70)) : 'freshtv72)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv73) * (
# 16 "parserProcessus.mly"
       (string)
# 365 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)) : 'freshtv76)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state * 'tv_element) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * 'tv_element) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_element)), _, (_2 : 'tv_elements)) = _menhir_stack in
        let _v : 'tv_elements = 
# 33 "parserProcessus.mly"
                                 ( (print_endline "elements : element elements") )
# 378 "parserProcessus.ml"
         in
        _menhir_goto_elements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv78)) : 'freshtv80)
    | _ ->
        _menhir_fail ()

and _menhir_goto_element : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_element -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv51 * _menhir_state * 'tv_element) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVITY ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | RESOURCE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | RIGHT_BRACE ->
        _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv52)

and _menhir_reduce5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_contraintes = 
# 42 "parserProcessus.mly"
                                     ( (print_endline "contraintes : /* Lambda, mot vide */") )
# 408 "parserProcessus.ml"
     in
    _menhir_goto_contraintes _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv49) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_action = 
# 47 "parserProcessus.mly"
                ( (print_endline "action : STARTS") )
# 422 "parserProcessus.ml"
     in
    _menhir_goto_action _menhir_env _menhir_stack _menhir_s _v) : 'freshtv50)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_action = 
# 48 "parserProcessus.mly"
                    ( (print_endline "action : FINISHES") )
# 436 "parserProcessus.ml"
     in
    _menhir_goto_action _menhir_env _menhir_stack _menhir_s _v) : 'freshtv48)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state * 'tv_element) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv43 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 458 "parserProcessus.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45) * (
# 16 "parserProcessus.mly"
       (string)
# 467 "parserProcessus.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv46)

and _menhir_reduce9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_elements = 
# 32 "parserProcessus.mly"
                                  ( (print_endline "elements : /* Lambda, mot vide */") )
# 476 "parserProcessus.ml"
     in
    _menhir_goto_elements _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENTIFIER _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 492 "parserProcessus.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AMOUNT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv31 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 503 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NUMBER _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv27 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 513 "parserProcessus.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 15 "parserProcessus.mly"
       (int)
# 518 "parserProcessus.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv25 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 525 "parserProcessus.ml"
                ))) = Obj.magic _menhir_stack in
                let ((_4 : (
# 15 "parserProcessus.mly"
       (int)
# 530 "parserProcessus.ml"
                )) : (
# 15 "parserProcessus.mly"
       (int)
# 534 "parserProcessus.ml"
                )) = _v in
                ((let ((_menhir_stack, _menhir_s), (_2 : (
# 16 "parserProcessus.mly"
       (string)
# 539 "parserProcessus.ml"
                ))) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_resource = 
# 38 "parserProcessus.mly"
                                             ( (print_endline "resource : resource IDENTIFIER amount NUMBER") )
# 546 "parserProcessus.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv23) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_resource) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_resource) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_resource) : 'tv_resource) = _v in
                ((let _v : 'tv_element = 
# 36 "parserProcessus.mly"
            ( (print_endline "element : resource") )
# 563 "parserProcessus.ml"
                 in
                _menhir_goto_element _menhir_env _menhir_stack _menhir_s _v) : 'freshtv20)) : 'freshtv22)) : 'freshtv24)) : 'freshtv26)) : 'freshtv28)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv29 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 573 "parserProcessus.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)) : 'freshtv32)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv33 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 584 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)) : 'freshtv36)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENTIFIER _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 608 "parserProcessus.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FINISHES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | STARTS ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | ACTIVITY | RESOURCE | RIGHT_BRACE ->
            _menhir_reduce5 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv16)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and fichier : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 21 "parserProcessus.mly"
      (unit)
# 647 "parserProcessus.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PROCESS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENTIFIER _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 678 "parserProcessus.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LEFT_BRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv1) * (
# 16 "parserProcessus.mly"
       (string)
# 689 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ACTIVITY ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | RESOURCE ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | RIGHT_BRACE ->
                    _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv2)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv3) * (
# 16 "parserProcessus.mly"
       (string)
# 711 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv4)) : 'freshtv6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv8)) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv12)) : 'freshtv14))

# 53 "parserProcessus.mly"
  

# 730 "parserProcessus.ml"

# 269 "<standard.mly>"
  

# 735 "parserProcessus.ml"
