%%{

	machine sql_parser;

	# Basic defintions
	parenthesis = ')'|'(';
	bracket = '['|']';
	period = '.';
	equalities = '='|'!='|'is not'i|'is'i;
	space;
	alnum;
	
	# Keyword definitions
	join = 'join'i;
	type = 'inner'i|'outer'i;
	direction = 'left'i|'right'i;
	as = 'as'i;
	select = 'select'i;
	frm = 'from'i;
	on = 'on'i;
	choice = 'and'i|'or'i;

	# Intermediate definitions
	alias = (space+ as space+);
	column = (alnum+\.)?(alnum+\.)?(alnum+\.);
	table = (alnum+\.)?(alnum+\.);
	identifier = (alnum+);
	join_type = (type space+ direction)? space+ join;
	alias_table = table alais identifier;
	on_clause = aliased_col equalities alaised_col;

	# Top level definitons
	aliased_col = (column alias? identifier);
	join_table = join_type space+ alias_table on on_clause (choice on_clause)*;

	# Parser
	main := |*
		
	*|;

}%%
