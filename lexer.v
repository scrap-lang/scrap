module main

import os
import regex

enum TokenKind {
	let
	ident
	eq
	plus
	sub
	mult
	div
	int
	float
	string

	// function tokens
	fun
	lp
	arrow
	cma
	rp
	lcbr
	rcbr

	smc
}

struct Token {
	kind TokenKind
	val string
}

struct Query {
	kind TokenKind
	re string
}

// order matters
const queries = [
	Query { kind: .let, re: r"let" },
	Query { kind: .ident, re: r"[a-z_][a-z\d_]*" },
	Query { kind: .eq, re: r"=" },
	Query { kind: .plus, re: r"+"},
	Query { kind: .sub, re: r"-"},
	Query { kind: .mult, re: r"\*"},
	Query { kind: .div, re: r"/"},
	Query { kind: .float, re: r"\d+\.\d+" },
	Query { kind: .int, re: r"\d+" },
	Query { kind: .string, re: r'"[^"]*"' },

	Query { kind: .fun, re: r"fn" },
	Query { kind: .lp, re: r"\("}
	Query { kind: .arrow, re: r"->"},
	Query { kind: .cma, re: r","},
	Query { kind: .rp, re: r"\)" }
	Query { kind: .lcbr, re: r"{" },
	Query { kind: .rcbr, re: r"}" },

	Query { kind: .smc, re: r";" }
]

fn lex(code string) ?[]Token {
	// stuff
	mut tokens := []Token{}
	mut pos := 0
	mut line := 0

	for pos < code.len {
		mut matched := false

		for query in queries {
			mut re := regex.regex_opt(query.re)?
			start, end := re.match_string(code[pos..])
			if start == -1 { continue }
			
			matched = true
			tokens << Token { kind: query.kind, val: code[pos..(pos + end)] }
			pos += end

			if query.kind == .smc {
				line++
			}
		}

		if !matched {
			mut re := regex.regex_opt(r"\s+")?
			start, end := re.match_string(code[pos..])

			if start == -1 {
				panic("expected whitespace $line")
			}

			pos += end
		}
	}

	return tokens
}

fn main() {
	// HEllo world
	code := os.read_file("code.scrap")?
	tokens := lex(code)?
	println(tokens)
}