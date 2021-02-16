module main

pub struct File {
mut:
	stmts []Stmt
}
/*
/*
fn main() {
	code := "let foo = 10"

	o := parse(code) or { panic('aaa') }
	println(o)
}
*/

fn parse(input string) ?File {
	// TODO: this.
	mut file := File{}
	mut scanner := new_scanner(input)

	for {
		l := scanner.peek() or { panic('no value') }
		if l == `l` {
			e := scanner.next() or { panic('no value') }
			if e == `e` {
				t := scanner.next() or { panic('no value') }
				if t == `t` {
					mut name := ""
					scanner.next() or { panic('no value') }
					for {
						peek := scanner.peek() or { panic('no value') }
						name += peek.str()
						nxt := scanner.next() or { panic('no value') }
						if nxt == ` ` {
							break
						}
					}
					file.stmts << LetStmt{ident: name, expr: IntLit{value: 5}}
				}
			}
		}
		break
	}

	return file
}
*/
