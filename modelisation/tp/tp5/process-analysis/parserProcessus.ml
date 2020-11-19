
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | STARTS
    | STARTED
    | RIGHT_BRACE
    | RESOURCE
    | REQUIRES
    | PROCESS
    | NUMBER of (
# 15 "parserProcessus.mly"
       (int)
# 17 "parserProcessus.ml"
  )
    | LEFT_BRACE
    | IF
    | IDENTIFIER of (
# 16 "parserProcessus.mly"
       (string)
# 24 "parserProcessus.ml"
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
  | MenhirState34
  | MenhirState31
  | MenhirState23
  | MenhirState19
  | MenhirState17
  | MenhirState16
  | MenhirState13
  | MenhirState9
  | MenhirState3

# 1 "parserProcessus.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 65 "parserProcessus.ml"

let rec _menhir_goto_activite : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_activite -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_activite) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_activite) : 'tv_activite) = _v in
    ((let _v : 'tv_element = 
# 35 "parserProcessus.mly"
                   ( (print_endline "element : activite") )
# 80 "parserProcessus.ml"
     in
    _menhir_goto_element _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)) : 'freshtv164)

and _menhir_goto_etat : _menhir_env -> 'ttv_tail -> 'tv_etat -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv159 * _menhir_state * 'tv_action)) * (
# 16 "parserProcessus.mly"
       (string)
# 90 "parserProcessus.ml"
    )) = Obj.magic _menhir_stack in
    let (_v : 'tv_etat) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv157 * _menhir_state * 'tv_action)) * (
# 16 "parserProcessus.mly"
       (string)
# 97 "parserProcessus.ml"
    )) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_etat) : 'tv_etat) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_action)), (_3 : (
# 16 "parserProcessus.mly"
       (string)
# 103 "parserProcessus.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_contrainte = 
# 53 "parserProcessus.mly"
                                       ( (print_endline "contrainte : action if IDENTIFIER etat") )
# 109 "parserProcessus.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv155) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_contrainte) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv153 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FINISHES ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | STARTS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | ACTIVITY | RESOURCE | RIGHT_BRACE ->
        _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv154)) : 'freshtv156)) : 'freshtv158)) : 'freshtv160)

and _menhir_goto_contraintes : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_contraintes -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv143 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 140 "parserProcessus.ml"
        )) * _menhir_state) * _menhir_state * 'tv_elements)) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_contraintes) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv141 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 148 "parserProcessus.ml"
        )) * _menhir_state) * _menhir_state * 'tv_elements)) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_7 : 'tv_contraintes) : 'tv_contraintes) = _v in
        ((let (((((_menhir_stack, _menhir_s), (_2 : (
# 16 "parserProcessus.mly"
       (string)
# 155 "parserProcessus.ml"
        ))), _), _, (_4 : 'tv_elements)), _, (_6 : 'tv_exigences)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_activite = 
# 41 "parserProcessus.mly"
                                                                                        ( (print_endline "activite : activity IDENTIFIER {elements} exigences contraintes") )
# 163 "parserProcessus.ml"
         in
        _menhir_goto_activite _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)) : 'freshtv144)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_contraintes) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_contraintes) : 'tv_contraintes) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_contrainte)) = _menhir_stack in
        let _v : 'tv_contraintes = 
# 51 "parserProcessus.mly"
                                       ( (print_endline "contraintes : contrainte contraintes") )
# 179 "parserProcessus.ml"
         in
        _menhir_goto_contraintes _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)) : 'freshtv148)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv151 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 187 "parserProcessus.ml"
        )) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_contraintes) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv149 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 195 "parserProcessus.ml"
        )) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_contraintes) : 'tv_contraintes) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 16 "parserProcessus.mly"
       (string)
# 202 "parserProcessus.ml"
        ))), _, (_3 : 'tv_exigences)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_activite = 
# 40 "parserProcessus.mly"
                                                     ( (print_endline "activite : activity IDENTIFIER contraintes") )
# 208 "parserProcessus.ml"
         in
        _menhir_goto_activite _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)) : 'freshtv152)
    | _ ->
        _menhir_fail ()

and _menhir_goto_action : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_action -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv139 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENTIFIER _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv131 * _menhir_state * 'tv_action)) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 234 "parserProcessus.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FINISHED ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv123) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv121) = Obj.magic _menhir_stack in
                ((let _1 = () in
                let _v : 'tv_etat = 
# 59 "parserProcessus.mly"
                    ( (print_endline "etat : FINISHED") )
# 250 "parserProcessus.ml"
                 in
                _menhir_goto_etat _menhir_env _menhir_stack _v) : 'freshtv122)) : 'freshtv124)
            | STARTED ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv127) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv125) = Obj.magic _menhir_stack in
                ((let _1 = () in
                let _v : 'tv_etat = 
# 58 "parserProcessus.mly"
               ( (print_endline "etat : STARTED") )
# 263 "parserProcessus.ml"
                 in
                _menhir_goto_etat _menhir_env _menhir_stack _v) : 'freshtv126)) : 'freshtv128)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv129 * _menhir_state * 'tv_action)) * (
# 16 "parserProcessus.mly"
       (string)
# 273 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)) : 'freshtv132)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv133 * _menhir_state * 'tv_action)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)) : 'freshtv136)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)) : 'freshtv140)

and _menhir_reduce6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_contraintes = 
# 50 "parserProcessus.mly"
                                     ( (print_endline "contraintes : /* Lambda, mot vide */") )
# 297 "parserProcessus.ml"
     in
    _menhir_goto_contraintes _menhir_env _menhir_stack _menhir_s _v

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_action = 
# 55 "parserProcessus.mly"
                ( (print_endline "action : STARTS") )
# 311 "parserProcessus.ml"
     in
    _menhir_goto_action _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv117) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_action = 
# 56 "parserProcessus.mly"
                    ( (print_endline "action : FINISHES") )
# 325 "parserProcessus.ml"
     in
    _menhir_goto_action _menhir_env _menhir_stack _menhir_s _v) : 'freshtv118)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_exigences : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exigences -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111 * _menhir_state * 'tv_requires) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state * 'tv_requires) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_requires)), _, (_2 : 'tv_exigences)) = _menhir_stack in
        let _v : 'tv_exigences = 
# 45 "parserProcessus.mly"
                                 ( (print_endline "exigences : REQUIRES") )
# 347 "parserProcessus.ml"
         in
        _menhir_goto_exigences _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)) : 'freshtv112)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv113 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 355 "parserProcessus.ml"
        )) * _menhir_state) * _menhir_state * 'tv_elements)) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FINISHES ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | STARTS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | ACTIVITY | RESOURCE | RIGHT_BRACE ->
            _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv114)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 375 "parserProcessus.ml"
        )) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FINISHES ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | STARTS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | ACTIVITY | RESOURCE | RIGHT_BRACE ->
            _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv116)
    | _ ->
        _menhir_fail ()

and _menhir_goto_elements : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_elements -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 402 "parserProcessus.ml"
        )) * _menhir_state) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RIGHT_BRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv75 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 412 "parserProcessus.ml"
            )) * _menhir_state) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | REQUIRES ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | ACTIVITY | FINISHES | RESOURCE | RIGHT_BRACE | STARTS ->
                _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16) : 'freshtv76)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv77 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 432 "parserProcessus.ml"
            )) * _menhir_state) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)) : 'freshtv80)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state * 'tv_element) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81 * _menhir_state * 'tv_element) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_element)), _, (_2 : 'tv_elements)) = _menhir_stack in
        let _v : 'tv_elements = 
# 33 "parserProcessus.mly"
                                 ( (print_endline "elements : element elements") )
# 445 "parserProcessus.ml"
         in
        _menhir_goto_elements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv82)) : 'freshtv84)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv107) * (
# 16 "parserProcessus.mly"
       (string)
# 453 "parserProcessus.ml"
        ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RIGHT_BRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv103) * (
# 16 "parserProcessus.mly"
       (string)
# 463 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv101) * (
# 16 "parserProcessus.mly"
       (string)
# 470 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_2 : (
# 16 "parserProcessus.mly"
       (string)
# 475 "parserProcessus.ml"
            ))), _, (_4 : 'tv_elements)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_processus = 
# 30 "parserProcessus.mly"
                                                               ( (print_endline "processus : process IDENTIFIER { elements }") )
# 483 "parserProcessus.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv99) = _menhir_stack in
            let (_v : 'tv_processus) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv97 * 'tv_processus) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv93 * 'tv_processus) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv91 * 'tv_processus) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, (_1 : 'tv_processus)) = _menhir_stack in
                let _2 = () in
                let _v : (
# 21 "parserProcessus.mly"
      (unit)
# 504 "parserProcessus.ml"
                ) = 
# 28 "parserProcessus.mly"
                        ( (print_endline "fichier : processus END") )
# 508 "parserProcessus.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv89) = _menhir_stack in
                let (_v : (
# 21 "parserProcessus.mly"
      (unit)
# 515 "parserProcessus.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
                let (_v : (
# 21 "parserProcessus.mly"
      (unit)
# 522 "parserProcessus.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
                let ((_1 : (
# 21 "parserProcessus.mly"
      (unit)
# 529 "parserProcessus.ml"
                )) : (
# 21 "parserProcessus.mly"
      (unit)
# 533 "parserProcessus.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv86)) : 'freshtv88)) : 'freshtv90)) : 'freshtv92)) : 'freshtv94)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv95 * 'tv_processus) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv96)) : 'freshtv98)) : 'freshtv100)) : 'freshtv102)) : 'freshtv104)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv105) * (
# 16 "parserProcessus.mly"
       (string)
# 549 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)) : 'freshtv108)
    | _ ->
        _menhir_fail ()

and _menhir_goto_element : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_element -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_element) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACTIVITY ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | RESOURCE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | RIGHT_BRACE ->
        _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv74)

and _menhir_reduce14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exigences = 
# 44 "parserProcessus.mly"
                                   ( (print_endline "exigences : /* Lambda, mot vide */") )
# 580 "parserProcessus.ml"
     in
    _menhir_goto_exigences _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NUMBER _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "parserProcessus.mly"
       (int)
# 596 "parserProcessus.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENTIFIER _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv65 * _menhir_state) * (
# 15 "parserProcessus.mly"
       (int)
# 607 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 612 "parserProcessus.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv63 * _menhir_state) * (
# 15 "parserProcessus.mly"
       (int)
# 619 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            let ((_3 : (
# 16 "parserProcessus.mly"
       (string)
# 624 "parserProcessus.ml"
            )) : (
# 16 "parserProcessus.mly"
       (string)
# 628 "parserProcessus.ml"
            )) = _v in
            ((let ((_menhir_stack, _menhir_s), (_2 : (
# 15 "parserProcessus.mly"
       (int)
# 633 "parserProcessus.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_requires = 
# 48 "parserProcessus.mly"
                                        ( (print_endline "requires : require NUMBER IDENTIFIER") )
# 639 "parserProcessus.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv61) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_requires) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv59 * _menhir_state * 'tv_requires) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | REQUIRES ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | ACTIVITY | FINISHES | RESOURCE | RIGHT_BRACE | STARTS ->
                _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv60)) : 'freshtv62)) : 'freshtv64)) : 'freshtv66)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv67 * _menhir_state) * (
# 15 "parserProcessus.mly"
       (int)
# 666 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)) : 'freshtv70)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 686 "parserProcessus.ml"
        )) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state * 'tv_element) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv47 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 705 "parserProcessus.ml"
        )) * _menhir_state) * _menhir_state * 'tv_elements)) * _menhir_state * 'tv_exigences) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state * 'tv_requires) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv51 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 719 "parserProcessus.ml"
        )) * _menhir_state) * _menhir_state * 'tv_elements)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv53 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 728 "parserProcessus.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 737 "parserProcessus.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv57) * (
# 16 "parserProcessus.mly"
       (string)
# 746 "parserProcessus.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)

and _menhir_reduce10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_elements = 
# 32 "parserProcessus.mly"
                                  ( (print_endline "elements : /* Lambda, mot vide */") )
# 755 "parserProcessus.ml"
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
        let (_menhir_stack : 'freshtv37 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 771 "parserProcessus.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AMOUNT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv33 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 782 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NUMBER _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv29 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 792 "parserProcessus.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 15 "parserProcessus.mly"
       (int)
# 797 "parserProcessus.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv27 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 804 "parserProcessus.ml"
                ))) = Obj.magic _menhir_stack in
                let ((_4 : (
# 15 "parserProcessus.mly"
       (int)
# 809 "parserProcessus.ml"
                )) : (
# 15 "parserProcessus.mly"
       (int)
# 813 "parserProcessus.ml"
                )) = _v in
                ((let ((_menhir_stack, _menhir_s), (_2 : (
# 16 "parserProcessus.mly"
       (string)
# 818 "parserProcessus.ml"
                ))) = _menhir_stack in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_resource = 
# 38 "parserProcessus.mly"
                                             ( (print_endline "resource : resource IDENTIFIER amount NUMBER") )
# 825 "parserProcessus.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv25) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_resource) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_resource) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_resource) : 'tv_resource) = _v in
                ((let _v : 'tv_element = 
# 36 "parserProcessus.mly"
            ( (print_endline "element : resource") )
# 842 "parserProcessus.ml"
                 in
                _menhir_goto_element _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)) : 'freshtv24)) : 'freshtv26)) : 'freshtv28)) : 'freshtv30)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv31 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 852 "parserProcessus.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)) : 'freshtv34)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv35 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 863 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)) : 'freshtv38)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENTIFIER _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "parserProcessus.mly"
       (string)
# 887 "parserProcessus.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LEFT_BRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 16 "parserProcessus.mly"
       (string)
# 898 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState9 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACTIVITY ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | RESOURCE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | RIGHT_BRACE ->
                _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv16)
        | REQUIRES ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | ACTIVITY | FINISHES | RESOURCE | RIGHT_BRACE | STARTS ->
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv18)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)

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
# 946 "parserProcessus.ml"
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
# 977 "parserProcessus.ml"
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
# 988 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ACTIVITY ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | RESOURCE ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | RIGHT_BRACE ->
                    _menhir_reduce10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
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
# 1010 "parserProcessus.ml"
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

# 61 "parserProcessus.mly"
  

# 1029 "parserProcessus.ml"

# 269 "<standard.mly>"
  

# 1034 "parserProcessus.ml"
