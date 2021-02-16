module main

import regex

enum TokenTypes {
	let // let
	string
	number
	name
	assign
}

struct Token {
	kind TokenTypes
	value string
	line int
	index int
}

const name_query = r'[a-zA-Z_][a-zA-Z0-9_]*'
const string_query = r'\".*?\"'

fn tokenize(mut scaned Scanner) []Token {
	mut out := []Token{}

	mut re := regex.regex_opt(name_query) or { panic(err) }
	for {
		t := scaned.peek() //or { continue }
		t_is_name, t_name_end := re.match_string(t)

		if t_is_name == 0 {
			name_pos := scaned.pos
			mut name := ""
			for {
				n := scaned.next()
				if n == ' ' {
					break
				}
				println(n)
				name += "$n"
				
			}
			println("'$name'")
			match name {
				'let' {
					println('matched')
					out << Token{kind: TokenTypes.let, value: "let", line: 0, index: name_pos}
					break
				}
				else {
					println('not matched')
					break
				}
			}
		}
		break
	}
	return out
}

fn main() {
	code := "let foo = 10"

	mut scaned := new_scanner(code)
	o := tokenize(mut scaned)
	
	println(o)
}
