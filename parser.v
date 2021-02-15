module main

// Im not sure what happen in the parser
struct IntLit {
	value int
}

struct LetStmt {
	ident string
	value ast
}

type ast = LetStmt | IntLit

struct File {
mut:
	stmts []Stmt
}


fn main() {
	letstmt := ast.LetStmt{}
	println(letstmt)
}
