module main

type Expr = IntLit // | StringLit | CharLit etc
type Stmt = LetStmt // | FnCall

struct IntLit {
	value int
}

struct LetStmt {
	ident string
	expr Expr
}
