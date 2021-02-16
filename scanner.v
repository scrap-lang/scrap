module main

// you gave me this struct, now what?
struct Scanner {
  tokens ustring
  mut:
    pos int
}

fn (mut scanner Scanner) next() ?string {
	scanner.pos++
	if scanner.pos >= scanner.tokens.len {
		return none
	}
	token := scanner.tokens.at(scanner.pos) //or { return none }
	return token
}

fn (mut scanner Scanner) prev() ?string {
	if scanner.pos > scanner.tokens.len {
		return none
	}
	return scanner.tokens.at(scanner.pos - 1) //or { return none }
}

fn (mut scanner Scanner) peek() ?string {
	if scanner.pos > scanner.tokens.len {
		return none
	}
	return scanner.tokens.at(scanner.pos) //or { return none }
}

fn new_scanner(input string) Scanner {
	return Scanner {
		tokens: input.ustring()
	}
}

/*
fn main() {
	// oi mate

	mut scanner := new_scanner("funct hello(world string) {\n\tout(\"Hello \${world}\")\n}")
	// assert scanner.next() == 'h'
	// assert scanner.peek() == 'e'
	// assert scanner.prev() == 'h'

	println(scanner.next())
	println(scanner.peek())
	println(scanner.prev())

	println(scanner.next())
	println(scanner.next())
	println(scanner.next())
	println(scanner.next())
	println(scanner.next())
	println(scanner.next())
	
}
*/
