module main


// you gave me this struct, now what?
//pub 
struct Scanner {
  tokens string
  mut:
    pos int
}

//pub 
fn byte_str(r byte) string {
	return rune(r).str()
}

//pub 
fn (mut scanner Scanner) next() string {
	if scanner.pos >= scanner.tokens.len {
		return 'nothin to see here'
	}
	thingy_that_is_one_character := scanner.tokens[scanner.pos]
	scanner.pos++

	return byte_str(thingy_that_is_one_character)
}

fn (mut scanner Scanner) prev() string {
	return byte_str(scanner.tokens[scanner.pos - 1])
}

fn (mut scanner Scanner) peek() string {
	return byte_str(scanner.tokens[scanner.pos])
}

//pub 
fn new_scanner(goddamnscrap string) Scanner {
	mut scanner := Scanner{
		tokens: goddamnscrap
	}
	return scanner
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
