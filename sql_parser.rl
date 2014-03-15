%%{

	machine sql_parser;

	parenthesis = ')'|'(';
	bracket = '['|']';
	period = '.';
	space;
	alnum;
	
	join = 'inner'i|'outer'i|'left'i|'right'i|'join'i;
	alias = 'as'i;
	select = 'select'i;

	main := |*
		
	*|;

}%%
