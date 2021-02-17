module main

type Ident = string

type Expr = IntLit | FloatLit | StringLit | FnCall

struct LetStmt {
	ident Ident
	expr Expr
}

struct Param {
	ident Ident
	typ Ident
}

struct FnDef {
	ident Ident
	params []Param
	stmts []Stmt
}

type Stmt = LetStmt | FnDef

fn parse(tokens []Token) ?[]Stmt {
	mut stmts := []Stmt{}
	mut pos := 0

	for pos < tokens.len {
		token := tokens[pos]

		match token.kind {
			else {}
		}
	}
}