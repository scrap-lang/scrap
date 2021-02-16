module main

import regex

// the things of importance
enum TokenTypes {
	let // let
	string
	number
	name
	assign
	function
	lp // (
	rp // )
	param // (value)
}

// one of these gets you one step closer to pain
struct Token {
	kind TokenTypes
	value string
	line int
	index int
}

// these are magical text strings used for matching text
const name_query = r'[a-zA-Z_][a-zA-Z0-9_]*'
const number_query = r'\d'
const string_query = r'\".*?\"'

// this makes pieces of pain
fn tokenize(mut scanned Scanner) []Token {
	mut out := []Token{}

	mut re_name := regex.regex_opt(name_query) or { panic(err) }
	mut re_number := regex.regex_opt(number_query) or { panic(err) }
	for {
		t := scanned.peek() or { println('problem') break }
		// println(t)

		t_is_name, t_name_end := re_name.match_string(t)
		t_is_number, t_number_end := re_number.match_string(t)
		// println(t_is_number)

		if t_is_name == 0 {
			mut name := t
			for {
				n := scanned.next() or { println('problem') break }
				if n == ' ' {
					break
				}
				
				name += "$n"
			}

			match name {
				'let' {
					out << Token{kind: TokenTypes.let, value: "let", line: 0, index: scanned.pos}
				}
				'fn' {
					// also get name of function
					out << Token{kind: TokenTypes.function, value: "fn", line: 0, index: scanned.pos}
				}
				else {
					out << Token{kind: TokenTypes.name, value: "$name", line: 0, index: scanned.pos}
				}
			}
			continue
		}

		if t == '=' {
			out << Token{kind: TokenTypes.assign, value: "=", line: 0, index: scanned.pos}
			scanned.next() or { println('problem') break }
			continue
		}

		if t == ' ' {
			scanned.next() or { println('problem') break }
			continue
		}

		if t_is_number == 0 {
			mut number := t
			for {
				n := scanned.next() or { println('problem') break }
				if n == ' ' {
					break
				}
				number += "$n"
			}
			out << Token{kind: TokenTypes.number, value: "$number", line: 0, index: scanned.pos}
			scanned.next() or { println('problem') break }
			continue
		}

		if t == '"' || t == "'" {
			mut str_ing := scanned.peek() or { println('problem') break }
			for {
				n := scanned.next() or { println('problem') break }
				if n == '"' || n == "'" {
					str_ing += n
					break
				} else if n == '\\' {
					str_ing += "\\"
				} else {
					str_ing += "$n"
				}
			}
			out << Token{kind: TokenTypes.string, value: "$str_ing", line: 0, index: scanned.pos}
			scanned.next() or { break }
			continue
		}

		if t == '(' {
			out << Token{kind: TokenTypes.lp, value: "(", line: 0, index: scanned.pos}
			// stuff
			continue
		}

		if t == ' ' {
			continue
		} else {
			println("invalid character: $t")
			break
		}
	}
	return out
}

fn main() {
	// the pain starts here for now
	code := 'let foo = 10'

	// this makes it possible to make pieces of pain
	mut scanned := new_scanner(code)

	// o
	o := tokenize(mut scanned)
	
	// this tells me if the pieces of pain are correct
	println(o)
}
