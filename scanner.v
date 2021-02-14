module main


// you gave me this struct, now what?
//pub 
struct Scanner {
  tokens ustring
  mut:
    pos int
}

//pub 
fn (mut scanner Scanner) next() rune {
	if scanner.pos >= scanner.tokens.len {
		return 'nothin to see here'
	}
	
	token := scanner.tokens[scanner.pos]
	scanner.pos++
	return token
}

fn (mut scanner Scanner) prev() rune {
	return scanner.tokens[scanner.pos - 1]
}

fn (mut scanner Scanner) peek() rune {
	return scanner.tokens[scanner.pos]
}

//pub 
fn new_scanner(input string) Scanner {
	return Scanner {
		tokens: ustring(input)
	}
}

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
