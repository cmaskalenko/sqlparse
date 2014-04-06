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
	col_id = '[alnum+]'|'alnum+';

	# Intermediate definitions
	alias = (space+ as space+);
	column = ((col_id\.)?col_id\.)?col_id;
	table = (col_id\.)?col_id;
	identifier = (alnum+);
	join_type = (type space+ direction)? space+ join;
	alias_table = table alais identifier;
	on_clause = aliased_col equalities alaised_col;

	# Top level definitons
	join_table = join_type space+ alias_table on on_clause (choice on_clause)*;

	# Machines for sub parts
	aliased_col = (column @coldef alias? identifier @colname);

	select_parts := ((aliased_col @{ fgoto aliased_col; } .(','.space)?)+ @{ fret; };;
	join_parts := 

	# Actions
	action coldef {
	}

	action colname {
	}

	# Scanner
	main := |*
		select => { fcall select_parts; };
		parenthesis => {};
		join_table => { fcall join_parts; };
	*|;

}%%
