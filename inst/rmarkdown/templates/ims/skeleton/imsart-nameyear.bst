%% This is file `imsart-nameyear.bst'
%%
%%
%% You are free to use this style file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.
%%
%% TeX programming: Linas Stonys, VTeX, Lithuania, lstonys@vtex.lt 
%%
%% This bibtex style produces structured bibliography (.bbl) file which could be
%% converted back into the database (.bib) format.
%% bibtex program must be invoked with the maximum allocation of memory (-w switch)
%%
%% This bibtex style could be used only with the imsart package 
%% starting with version from 2009/08/13

%% 2010-02-01 - splited inits "A.D." -> "A. D." and "A.{\,}D." -> "A. D."
%% 2010-03-19 - fixed sorting.
%% 2011-01-07 - inserted options: sort, nameyear, alpha, number.
%% 2013-01-28 - added: arxiv, mrnumber. Changed tags.

ENTRY
  { address
    author
    arxiv
    booktitle
    bpt_note
    bpt_ok
    chapter
    doi
    edition
    editor
    howpublished
    institution
    isbn
    journal
    key
    month
    mrnumber
    note
    number
    organization
    pages   
    publisher
    school
    series
    src
    sortkey
    title
    type
    volume
    year
    url
    id
    options
  }
  {}
   { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence
           after.block between.elements }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #5 'between.elements :=
}

STRINGS { s t tmp1 tmp2 tmp3 tmp4 tmp5}
STRINGS { longest.label last.label list.string temp.str default.list}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}


FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { " " * write$ newline$}
    { output.state after.block =
        { add.period$ write$
          newline$
         % "\newblock " write$
        }
        { output.state between.elements =
            { ", " * write$ newline$ }
            { output.state before.all =
                'write$
                { add.period$ " " * write$ newline$}
              if$
            }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    {output.nonnull}
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    {output.nonnull}
  if$
}



FUNCTION {insert.comma}
{ output.state before.all =
    'skip$
    { between.elements 'output.state := }
  if$
}
FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state :=}
      if$
    }
  if$
}


FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

STRINGS { v l f j b ff}
INTEGERS { nameptr namesleft numnames bother}
INTEGERS {str.length count return save.num1 save.num2 save.num3 save.num4 int done}
FUNCTION {is.in.list}{
	'f :=
	%%%% issisaugoju originalius "s" ir "t"
	s 'j :=
	f 's :=
	t 'f :=  
  list.string text.length$ 'str.length :=
  list.string 't :=
%  s text.length$ 'slen :=
  int   'save.num1 :=
  count 'save.num2 :=
  #1 'int :=
  #1 'count :=
  #0 'return :=
    
    { count str.length = not 
      #0 str.length = not
      and
    }
    {
			count #1 + 'count :=
		  t int #1 substring$ "," =
      	{
      	  t #1 int substring$ s "," * =
      	    {
		  		   #1 'return :=
  			      str.length 'count :=
			   	  }
	    			'skip$
         if$
	        
	        int #1 + 'int :=
   		    t int global.max$ substring$ 't :=
				  #0 'int :=
      	}
      	'skip$
      if$	
      int #1 + 'int :=
%			"count=" count int.to.str$ * " slen=" * str.length int.to.str$ * top$
    }
  while$

  save.num1 'int   :=
  save.num2 'count :=
  
  #0 return =
  	{ s t =
		    {#1 'return :=}
		    'skip$
		  if$
  	}
  	'skip$
  if$
	%%%% grazinu originalius "s" ir "t"
	j 's :=
	f 't :=  
	
	return		
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% formating bbl
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FUNCTION {make.tag}
{ 't :=
  duplicate$ empty$
    { pop$ "" }
    { bother #0 =
    	{	t "volume" =
    			{"\textbf{"  swap$ * "}" * }
    			'skip$
    		if$
    	}
	    { "\b" t * "{" * swap$ * "}" * }
	  if$
    }
  if$
}

INTEGERS {sk}
FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {byear}
{ duplicate$ empty$
    { pop$ "" }
    {'t :=
     t text.length$ 'sk :=
			#5 sk =
					{t #1 #4 substring$ 's :=
					 t #5 #1 substring$ 'longest.label :=
					 	longest.label is.num not	
							{"\byear{" s * "}" * longest.label * }
							{"\byear{"  t * "}" * }
						if$
					}
					{t "year" make.tag 
  						"type=nameyear" is.in.list						
							{extra.label *}
							'skip$
						if$
					}
			if$
    }
  if$
}



FUNCTION {format.address}
{address empty$
	{ "" }
	{address "address" make.tag }
  if$
}

FUNCTION {format.organization}
{organization empty$
		{ "" }
		{organization "publisher" make.tag}
  if$
}

FUNCTION {format.org}
{organization empty$
	{ "" }
	{organization "organization" make.tag add.period$}
  if$
}




FUNCTION {format.pub.address}
{ publisher empty$
    { "" }
    { publisher "publisher" make.tag
      address empty$
        'skip$
        {", " * format.address * add.period$}
      if$
    }
  if$
}

FUNCTION {mk.tag}
{ 'temp.str :=
  duplicate$ empty$
    { pop$ "" }
    { 
    	b "nothing" =
    		'skip$
			{"\b" temp.str * "{" * swap$ * "}" * }
		if$
	}
  if$
}

FUNCTION {space.after.dot}
{'t :=
	"" 'l :=
	"" 's :=
  { t empty$ not }
  {   t #1 #1 substring$ 's :=
		  l  s * 'l := 
      s "." = 
				{ t #2 #1 substring$ " " =
    	      'skip$
		 			  {
						  l  " " * 'l := 
						  t #2 #4 substring$ "{\,}" =
		 			  		{
						  	  t #5 global.max$ substring$ 't :=
		 			  		}
    	     		  'skip$
      	  		if$ 
		 			  }
      	  if$  
				} 
				'skip$
				
      if$
  	  t #2 global.max$ substring$ 't :=
    }
  while$
  l 
}

FUNCTION {format.author.editor}
{ 	'b :=
  	
  	b "editor" =
  	b "beditor" =
  	b "editor2" =
  	or or
		{editor space.after.dot 's :=}
		{author space.after.dot 's :=}
	if$

  	#1 'nameptr :=
  	s num.names$ 'numnames :=
  	numnames 'namesleft :=
    { namesleft #0 > }
    {	
    	s nameptr "{vv}" format.name$ "particle" mk.tag  'v := 
       	s nameptr "{ll}" format.name$ "snm"      mk.tag  'l :=   
    	s nameptr "{f.}" format.name$ "inits"    mk.tag  'f := 
    	s nameptr "{ff}" format.name$ "fnm"      mk.tag  'ff := 
     	s nameptr "{jj}" format.name$ "suffix"   mk.tag  'j := 
  		
  		j empty$
	   		{"" 'j :=} 		
	   		{" " j * 'j :=} 		
		if$
 		
 		v empty$
	   		{"" 'v :=} 		
	   		{v " " * 'v :=} 		
		if$
 		
 		l  "\bsnm{others}" =
  			{  "et~al." "etal" make.tag * }
  			{
   				b "editor2" =
	 				{"\beditor{" * ff * f * 
						ff "" = f "" = and
		  					'skip$
		  					{"~" * }
		  				if$
	 					v * l * j * "}" * "" 't :=
	 				}
		  			'skip$
				if$

			   	b "author" =
   				b "editor" =
   				or
	 				{"\b" * b * "{" * v * l * 
						ff "" = f "" = and
		  					'skip$
		  					{",~" * }
		  				if$
	 					ff * f * j * "}" * "" 't :=}
		  			'skip$
				if$

			} 
 		if$

		namesleft #0 >
        { namesleft #1 >
            { namesleft #2 =
    		        	{ s numnames "{ll}" format.name$ "others" =
    		        	  {" " * t * }
    		        	  {" \AND " * t * }
    		        	  if$
    		        	}
    		        	{", " * t * }
		          if$
           	}
            {""}
          if$
        }
        't
      
      if$
      nameptr #1 + 'nameptr := 
      namesleft #1 - 'namesleft :=
    }
  while$
}


FUNCTION {format.editors}
{ editor empty$
	{""}
    {
    	bother #0 =
			{author empty$
   		  		{"editor"}
   				{"nothing"}
   		 	if$
  			}
			{"editor"}
		if$  
	  	format.author.editor
      editor num.names$ #1 >
        { ", eds." * }
        { ", ed." * }
      if$
    }
  if$
}

FUNCTION {format.authors}
{ author empty$
	{""}
    {"author"  format.author.editor}
  if$
}

FUNCTION {make.editors}
{ editor empty$
    { "" }
    { "("  

    	bother #0 =
			{author empty$
   		  		{"editor"}
   				{"nothing"}
   		 	if$
  			}
			{"editor2"}
		if$  
	  	format.author.editor
						 *
      editor num.names$ #1 >
        { ", eds.)" * }
        { ", ed.)" * }
      if$
    }
  if$
}



FUNCTION {cite.author.editor}
{ 's :=

  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #3 >
    { pop$ " et~al." * }
    { #3 =
        { s #3 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
            { " et~al."  * }
            { ", " * s #2 "{vv~}{ll}" format.name$ * 
             " and " * s #3 "{vv~}{ll}" format.name$ *  
            }
          if$
        }
		    {s num.names$ #2 =
    		        {s #2 "{vv~}{ll}{ jj}{ f}" format.name$ "others" =
            				{ " et~al."  * }
     		    				{ " and " * s #2 "{vv~}{ll}" format.name$ * }
     		    			if$
     		    		}
     		    		'skip$
        	 if$
        }
      if$
    }
  if$
}


FUNCTION {check.auth.edit.org}
{author empty$
		{
			editor empty$
					{
						organization empty$
								{""}
								{organization}
						if$		
					}
					{editor cite.author.editor}
			if$		
		}
		{author cite.author.editor}
 if$	
}

FUNCTION {check.year}
{year empty$
		{""}
		{year extra.label *
		}
	if$	
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem"
  "type=nameyear" is.in.list
     {
 	    "[\protect\citeauthoryear{" * write$
	   			check.auth.edit.org write$ 
	   	"}{" write$ 
	   			check.year write$ 
	   	"}]" 
    }
    'skip$
  if$
  "type=alpha" is.in.list
     {
 	    "[" * write$
  	  label write$
	    "]" 
    }
    'skip$
  if$

  "{" * write$  
  cite$ write$
  "}" write$
  newline$
  "" before.all 'output.state :=
}

INTEGERS { multiresult char.num k }

 
FUNCTION {string.to.integer}
{ 't :=
    t text.length$ 'k :=
  #1 'char.num :=
      { t char.num #1 substring$ 's :=
	 	  s is.num
	 	  s "." =
	 	  or 
	 	  char.num k = not
	 	  and
	 	 	}
	 	 {char.num #1 + 'char.num :=}
  while$
  char.num #1 - 'char.num :=
  t #1 char.num substring$ 
}

FUNCTION {check.mrnumber}
{mrnumber 't :=
  ""
    { t empty$ not }
    { t #1 #2 substring$ "\#" = 
			{ t #1 #2 substring$ *
	 			 t #2 global.max$ substring$ 't :=
			}
			{
			  t #1 #1 substring$ "#" = 
					{ "\#" *
		 					 t #2 global.max$ substring$ 't :=
					}
				{ t #1 #1 substring$ *
	 			 t #2 global.max$ substring$ 't :=
				}
     	 if$
      }
      if$
    }
  while$
}


FUNCTION {remove.braces}
{'t :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "{" = 
			t #1 #1 substring$ "}" = 
			or
				{ 
		 			 t #2 global.max$ substring$ 't :=
				}
				{ t #1 #1 substring$ *
		 			 t #2 global.max$ substring$ 't :=
				}
			if$
    }
  while$
}

FUNCTION {format.mrnumber}
{ mrnumber empty$
    { "" }
    {	bother #0 =
		     {check.mrnumber} 
		     {"\bmrnumber{" check.mrnumber * "}" * }
			if$
    }
  if$
}

INTEGERS { found }
FUNCTION {cut.info}
{ 't :=
 #0 'found := 
 "" 's :=
 "" 'v :=
    { t empty$ not }
    { 
      t #1 #5 substring$ "info:" = 
			  { 
    		  t #6 global.max$ substring$ 't :=
    		  #1 'found := 
          "}" 'v :=
			  }
			  'skip$
      if$

      t #1 #1 substring$ "/" = 
      #1 found =
      and
			  { 
    		  t #2 global.max$ substring$ 't :=
    		  s "={" * 's :=
    		  #0 'found := 
           
			  }
			  'skip$
      if$   

      t #1 #2 substring$ ", " = 
      v "}" =
      and
			  { 
    		  t #2 global.max$ substring$ 't :=
    		  s "}," * 's :=
			  }
			  'skip$
      if$   
            s t #1 #1 substring$ * 's :=  
	 			    t #2 global.max$ substring$ 't :=
    }
  while$
s v *
}

FUNCTION {format.id}
{ id empty$
    { "" }
    {	bother #0 =
		     { "" } 
		     {"\bid{" id cut.info * "}" * }
			if$
    }
  if$
}

FUNCTION {format.journal}
{ journal empty$
    { "" }
    {	bother #0 =
		     {journal "t" change.case$} 
    		 {"\bjournal{" journal  * "}" * } 
			if$
    }
  if$
}
FUNCTION {title.sep}
{ type$ "article" =
	type$ "incollection" =
	type$ "inproceedings" =
	type$ "booklet" =
	type$ "unpublished" =
	or or or or
		'add.period$
		'skip$
	if$

	type$ "inbook" =
	type$ "manual" =
	or
	edition empty$ not
	and 
		{"," *}
		{
			edition empty$ 
			series empty$ not
			and
				'add.period$
				'skip$
			if$	
		}
	if$

	type$ "book" =
		{
			edition empty$ not
			series empty$ not
			and
				{"," *}
				{
				 edition empty$ 
				 series empty$ not
				 and
						'add.period$
						'skip$
				 if$		
				}
			if$
		}
		'skip$
	if$
	
}

FUNCTION {format.title}
{ title empty$
    { "" }
    {
    	title "title" make.tag
    	title.sep
    }
  if$
}
FUNCTION {format.year}
{ year empty$
    {""}
    {	bother #0 =
    		{"(" year  extra.label * * ")." *}  
    		{"(" year byear * ")." *}  
			if$
    }
    if$
}

FUNCTION {format.month}
{ month empty$
    {""}
		{ "\bmonth{" month  * "}" *}
	if$
}
FUNCTION {format.type}
{ type empty$
    {""}
		{ "\btype{" type * "}" *}
	if$
}

FUNCTION {formatpatent.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$}
         
      if$
    }
    { month empty$
       { year byear}
        {format.month " " * year byear *}
      if$
    }
  if$
}
FUNCTION {format.btitle}
{ title "btitle" make.tag
}



FUNCTION {format.note}
{ note empty$
    {""}
    {	note "note" make.tag}
  if$
}
FUNCTION {format.bptnote}
{bpt_note empty$
	{""}
	{"\bptnote{" bpt_note * "}%" * 	}
if$	
}
FUNCTION {format.bptok}
{bpt_ok empty$
	{""}
	{"\bptok{" bpt_ok * "}%" * 	}
if$	
}

FUNCTION {add.note}
{ note empty$
    {""}
    { note }
  if$
}
FUNCTION {format.chapter}
{chapter empty$
	{""}
	{"\bchapter{" chapter * "}" * 	}
if$	
}


FUNCTION {chap.type}
{chapter empty$
	{""}
	{	type empty$
			{ "Chapter "}
			{ type "Section" = 
	 				{	"Section "}
					{ "Chapter "}
				if$	
			}
		if$
		 "\bchapter{" chapter * "}" * *
	}
if$	
}
								
  
FUNCTION {chap.note}
{	format.note output 
     new.sentence
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}
FUNCTION {no.space.connect}
{ duplicate$ text.length$ #3 <
    { "" }
    { "" }
  if$
  swap$ * *
}


%%%%%%%%%%%%%%%%%%%%%%%%%% patent names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}
FUNCTION {format.series}
{ series empty$
	{ "" } 
    {	bother #0 =
		     {series} 
    		 {"\bseries{" series * "}" * } 
			if$
    }
  if$
}
FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { edition  "l" change.case$ }
        { edition  "t" change.case$ }
      if$
      "edition" make.tag
      " ed." *
    }
  if$
}


FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult 
}
FUNCTION {format.isbn}
{ isbn empty$
    { "" }
	{"\bisbn{" isbn * "}" *}
  if$
}

FUNCTION {format.school}
{ school empty$
	{""}
    {"\bpublisher{" school * "}" * } 
  if$
}

FUNCTION {format.institution}
{ institution empty$
	{""}
    {	bother #0 =
		     {institution} 
    		 { "techreport" type$ =
    		 			{"\bpublisher{" }
    		 			{"\binstitute{" }
    		 		if$	
    		 		
    		 		institution * "}" * 
    		 } 
			if$
    }
  if$
}
FUNCTION {format.howpublished}
{ howpublished empty$
	{""}
    { howpublished "howpublished" make.tag }
  if$
}

FUNCTION {format.vol}
{ volume empty$
  number empty$
  and
  	{""}
 		{ volume empty$ 
			  {number} 
		    {volume}
 		  if$
      "volume" make.tag
	  }
  if$
}

FUNCTION {note.presented}
 {note #1 #9 substring$ "presented" = 
 	note #1 #9 substring$ "Presented" = 
 or}
 


FUNCTION {format.url}
{ url empty$
    { "" }
		{"\url{" url * "}" * }
	if$
}

FUNCTION {format.arxiv}
{ arxiv empty$
    { "" }
	{"\arxiv{" arxiv * "}" * } 
  if$
}

FUNCTION {format.doi}
{ doi empty$
	{""}
	{"\bdoi{" doi  * "}" * } 
  if$
}

FUNCTION {format.ppages}
{ pages  empty$ 
	{""}
	{pages "pages" make.tag 
     add.period$
    }
  if$
}


FUNCTION {format.booktitle}
{ booktitle empty$
    { "" }
    {	bother #0 =
		     {"In " booktitle *} 
    		 {"In \bbooktitle{" booktitle * "}" *} 
			if$
			type$ "incollection" =
				{	series empty$
					volume empty$
					and
						'skip$
						{ editor empty$ series empty$ not and
						   {"." *} 
						   {"," *} 
							if$
						}
					if$	
				}
				'skip$
			if$
				
			type$ "inproceedings" =
				{	series empty$
					editor empty$
%					volume empty$ not
					and 
						'skip$
						{editor empty$
							  {"." *}
							  'skip$
						 if$ 
						}
					if$	
				}
				'skip$
			if$	
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "\btype{Technical Report}" }
    { "\btype{" type * "}" * }
  if$

  number empty$
		 'skip$
    { " No. \bnumber{" number * "}" * * }
  if$

%  type empty$ not 
%  number empty$
	institution empty$ not
    	{"," *}
    	'skip$
 	if$

}

FUNCTION {format.number}
{number empty$
		{""}
    {"\bnumber{" number * "}" * } 
  if$
}
INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}   
 

FUNCTION {bcomment.note}
{note empty$
'skip$
 {note  "note" make.tag output add.period$}
 if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      "\btype" type * "}" *
    }
  if$
}


FUNCTION {element.type}
{	bother #0 =
  		{"\begin{botherref}" write$ newline$}
  		{"\begin{" write$
			"b"
			"conference" type$ =
              	{"inproceedings"}
				{
					"proceedings" type$ =
              			{"book"}
						'type$
					if$
				} 
            if$ 
			*  		write$
  			"}["  write$
  					src empty$
  						{"author" write$}
  						{src write$ }
  					if$
  			"]" write$ newline$
  		}
  if$
}
FUNCTION {end.element.type}
{write$ newline$
	bother #0 =
  		{"\end{botherref}" write$ newline$}
  		{"\end{" write$
			"b"
			"conference" type$ =
              	{"inproceedings"}
				{
					"proceedings" type$ =
              			{"book"}
						'type$
					if$
				} 
            if$ 
			*	write$
  			"}" write$ newline$
  		}
  if$
  "\endbibitem" write$ newline$
}
FUNCTION {same.end}
{ add.period$
  format.doi output
	%new.sentence
  format.mrnumber output
	%new.sentence
  %format.url output
	new.sentence
  format.arxiv output
	new.sentence
	format.id       output
	format.bptnote  output
	format.bptok  output
 }

FUNCTION {settings}{}

FUNCTION {article}
{ output.bibitem
	#1 'bother := 
	element.type
	format.authors output.nonnull
	format.year output
	format.title "title" output.check
	format.journal  output 
	format.vol 			output 
  	format.ppages 	output
  	new.sentence
	bcomment.note
  	same.end
	end.element.type
}


FUNCTION {manual}
{ output.bibitem
	#1 'bother := 
	element.type
  	author empty$
    	{ organization empty$
        	'skip$
        	{ format.organization output.nonnull}
      	  if$
    	}
    	{ format.authors output.nonnull}
  	if$
    format.year output
  	new.sentence
  	format.title "title" output.check
  
  	format.edition output
  	author empty$
    	{ organization empty$
        	'skip$
        	{ format.address output}
      	  if$
    	}
    	{ 	format.organization output
      		address empty$
         		'skip$
         		{ insert.comma }
      		if$
	      	format.address output
    	}
  	if$
 % new.sentence
	bcomment.note
  	same.end
	end.element.type
}
 

FUNCTION {patent}
{  #1 'bother := 
 	output.bibitem
 	element.type
  format.authors output.nonnull
  format.year output
  format.title "title" output.check
	format.number output
  new.sentence
	bcomment.note
  same.end
	end.element.type
}

FUNCTION { other } { patent }

FUNCTION {book}
{ output.bibitem
	#1 'bother := 
	element.type
  	author empty$
    	{ format.editors output}
    	{ format.authors output.nonnull}
  	if$
  	format.year output
  	format.title  output
	series empty$
	  {
		  format.vol output
		  edition empty$
    		'new.sentence
				'insert.comma	  
		  if$
			format.edition output
    	new.sentence
		}
		{
			format.edition output
	    new.sentence
  		format.series output
		  format.vol output
    	new.sentence
		}
	if$
  	format.pub.address output
	bcomment.note
  	same.end  
	end.element.type
}

FUNCTION {booklet}
{  #1 'bother := 
  	output.bibitem
 	element.type
  	format.authors output.nonnull
  	format.year  output
  	format.title "title" output.check
  	format.howpublished output
 	address empty$
		'new.sentence
    	'insert.comma
	if$
	format.address output
	bcomment.note
  	same.end
 	end.element.type
}

FUNCTION {inbook}
{ output.bibitem
	#1 'bother := 
	element.type
  	author empty$
    	{ format.editors output}
    	{ format.authors output.nonnull}
  	if$
 	format.year output
 	format.title output
 	format.booktitle output
 	format.edition output
 	series empty$
 		'skip$
  		{new.sentence}
 	if$ 	
 	format.series output
 	format.vol output
 	format.chapter output
 	chapter empty$ not
	pages empty$ not
	and
	  	'insert.comma
	  	'skip$
	if$
 	format.ppages output
 	new.sentence
 	format.pub.address output
 	chap.note %output
 	new.sentence
 	same.end
	end.element.type
}

FUNCTION {incollection}
{ output.bibitem
	#1 'bother := 
	element.type
	format.authors output.nonnull
	format.year output
 	format.title "title" output.check
	format.booktitle "booktitle" output.check
  	format.edition output
  	make.editors output 
  	series empty$ editor empty$
  	or
  		'skip$
  		'new.sentence
	if$
	format.series output
  format.vol output
  format.chapter output
 	chapter empty$ not
	pages empty$ not
	and
	  	'insert.comma
	  	'skip$
	if$
  format.ppages output
  format.pub.address output
	bcomment.note
 	same.end
	end.element.type
}

FUNCTION {inproceedings}
{ output.bibitem
	#1 'bother := 
	element.type
	format.authors output.nonnull
	format.year output
  	format.title "title" output.check
  	format.booktitle "booktitle" output.check
  	make.editors output  
  	editor empty$ series empty$
  	or
  		'skip$
  		'new.sentence
  	if$
	format.series output
 	format.vol output
 	format.ppages output
  	new.sentence
	publisher empty$
    	{format.organization output}
        {format.org output}
    if$
  	format.pub.address output
	bcomment.note
  	same.end
	end.element.type
}

FUNCTION {conference} { inproceedings }


FUNCTION {mastersthesis}
{  #1 'bother := 
  	output.bibitem
 	element.type
  	format.authors output.nonnull
  	format.year  output
  	format.title "title" output.check
        insert.comma
  	type empty$
    	{"\btype{Master's thesis}" output.nonnull}
     	{format.type output}
  	if$     
  	school empty$
    	'skip$
     	{ insert.comma }
  	if$
  	format.school  output
  	address empty$
    	'skip$
     	{ insert.comma }
  	if$
  	format.address output
	bcomment.note
  	same.end
	end.element.type
}

FUNCTION {misc}
{  #1 'bother := 
  	output.bibitem
 	element.type
  	author empty$
    	{ organization empty$
        	'skip$
        	{ format.org output.nonnull}
      	  if$
    	}
    	{ format.authors output.nonnull}
  	if$
  	format.year output
  	format.title "title" output.check
  	new.sentence
  	format.howpublished output
  	new.sentence
  	author empty$
    	{ organization empty$
        	'skip$
        	{ format.address output}
      	  if$
    	}
    	{ 	format.organization output
      		address empty$
         		'skip$
         		{ insert.comma }
      		if$
	      	format.address output
    	}
  	if$
  	new.sentence
 	bcomment.note
  	same.end
 	empty.misc.check
 	end.element.type
}

FUNCTION {phdthesis}
{  #1 'bother := 
  	output.bibitem
 	element.type
  	format.authors output.nonnull
  	format.year output
  	format.title "title" output.check
        insert.comma
  	type empty$
    	{"\btype{PhD thesis}" output.nonnull}
     	{format.type output}
  	if$     
  	school empty$
    	'skip$
     	{ insert.comma }
  	if$
  	format.school output
  	address empty$
    	'skip$
     	{ insert.comma }
  	if$
  	format.address output
	bcomment.note
  	same.end 
 	end.element.type
}

FUNCTION {proceedings}{book}

FUNCTION {techreport}
{  #1 'bother := 
	output.bibitem
	element.type
  	format.authors output.nonnull
  	format.year output
  	format.title "title" output.check
  	format.tr.number output
	format.institution output
	new.sentence
  	address empty$
    	'skip$
     	{ insert.comma }
  	if$
  	format.address output
	bcomment.note
  	same.end
	end.element.type
}

FUNCTION {unpublished}
{  #1 'bother := 
	output.bibitem
	element.type
  	format.authors output.nonnull
  	format.year output
  	format.title "title" output.check
	bcomment.note
  	same.end
	end.element.type
}

FUNCTION {default.type} { unpublished }


READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

%%%%% setting default options
FUNCTION {default.option.string}
{"sort=1,type=nameyear"}

FUNCTION {set.default.opt}
{default.option.string 'list.string :=}

EXECUTE {set.default.opt}
INTEGERS {length2}


FUNCTION {in.string}{
	l 'tmp1 :=
	v 'tmp2 :=  
 
 	'l := % chars
	'v := % string 
	l text.length$ 'length2 :=
  	v text.length$ 'str.length :=

  	int   'save.num1 :=
  	count 'save.num2 :=
  	#1 'int :=
  	#0 'count :=
  	#0 'found :=
	
	length2 str.length =
		'skip$
		{
			l v = 
				{#1 'found :=}
				{
    				{ 
      					count str.length = not 
      					#0 str.length = not
      					and
    				}
    				{
	   					count #1 + 'count :=
	   					v int length2 substring$ l =
      						{
      							#1 'found :=
								str.length 'count :=  % to finish while$ loop
      						}
      						'skip$
      					if$	
      					int #1 + 'int :=
    				}
  					while$
					
				}
			if$
		}
	if$
  	save.num1 'int   :=
  	save.num2 'count :=
	tmp1 'l :=
	tmp2 'v :=  
		
	found
}


FUNCTION {split}{
	l 'tmp1 :=
	v 'tmp2 :=  
 
	'l := % split by
	'v := % string to split
	
	l text.length$ 'length2 :=
  	v text.length$ 'str.length :=
  	
  	int   'save.num1 :=
  	count 'save.num2 :=
  	found 'save.num4 :=
 
  	#1 'int :=
  	#0 'count :=
  	#0 'found :=
    {
      count str.length = not 
      #0 str.length = not
      and
    }
    {
	   count #1 + 'count :=

	   v int length2 substring$ l =
      	{
			v #1 int #1 - substring$    'l :=	% surasta dalis
			v int #1 + #100 substring$  'v :=   % likusi dalis
			#1 'found :=
			str.length 'count :=                 % kad nutruktu ciklas
      	}
      	'skip$
      if$	
      int #1 + 'int :=
    }
  while$
  	save.num1 'int   :=
  	save.num2 'count :=

  	found #0 =
  		{
  			%l  'l :=
  			"" 'l :=
  		}
  		'skip$ 
  	if$
	save.num4 'found :=

	v l

	tmp1 'l :=
	tmp2 'v :=  
}

FUNCTION {add.option}{
	l 'tmp3 :=
	v 'tmp4 :=  

 
	'l := % option 
	'v := % list
	
	v
	v "" =
		{""}
		{","}
	if$
	l * * 
	tmp3 'l :=
	tmp4 'v :=  
}

FUNCTION {remove.option}{
	
	%%%% issisaugoju originalius "s" ir "t"
	l 'j :=
	v 'f :=  
 
	'l := % option name
	'v := % list
	
	"" 'temp.str := % temporary list
	 
	l text.length$ 'length2 :=
  	v text.length$ 'str.length :=

  	int   'save.num1 :=
  	count 'save.num2 :=
  	done  'save.num3 :=
  	
  	#1 'int :=
  	#0 'count :=
  	#0 'found :=
	
	length2 str.length > 
		'skip$
		{
			#0 'done :=
			v  'f :=

			{done #0 = }
			{
				
				 v "," in.string
				 	{
				 		v	"," split 
				 		'f :=	% rasta
				 		'v :=  % kas liko
					 	
				 	}
				 	{
					 		#1 'done :=
					 		v 'f :=  
				 	}
				 if$

				f l in.string
   					'skip$
					{
						temp.str f add.option 'temp.str :=
					}
				if$
			}
			while$

		}
	if$
  	save.num1 'int   :=
  	save.num2 'count :=
  	save.num3 'done  :=

	temp.str
	j 'l :=
	f 'v :=  
	
}

FUNCTION {assign.opt}{
  % priskiriu options lauka, kad galeciau i(is)jungti "unsort"
  "settings" type$ =
  	{options empty$
		'skip$
  		{	
  			"" 'b :=
  			"" 'tmp5 :=
  			#0 'done :=  	
  			
  			options "=" in.string                % if options has '='
  				{
  					options 'b :=
  					b 'tmp5 :=
  					
					{done #0 = }
					{
						 b "," in.string
						 	{
						 		b	"," split 
						 		'tmp5 :=	% rasta
						 		'b :=  % kas liko
						 	}
						 	{
 						 		#1 'done :=
 						 		b 'tmp5 :=
						 	}
						 if$

						 tmp5 "=" in.string
						 			{
						 				tmp5 "=" split
						 				's :=	% before
						 				't :=   % after
						 				list.string s remove.option 'list.string :=
						 			}
						 			'skip$
						 if$
						 		
						 list.string tmp5 add.option 'list.string :=
					}
					while$
  				
  				}
  				'skip$
  			if$		
  		}
  	 if$
  	}
  	'skip$
  if$
  
}

ITERATE {assign.opt}

INTEGERS { et.al.char.used }

FUNCTION {initialize.et.al.char.used}
{ #0 'et.al.char.used :=
}
EXECUTE {initialize.et.al.char.used}

FUNCTION {format.lab.names.nameyear}
{ remove.braces 's :=
  s num.names$ 'numnames :=
  numnames #3 >% nuo kada daryti et~al.
    { s #1 "{vv~}{ll}" format.name$ " et~al." * } 
    {
      numnames #1 - 'namesleft :=
      #2 'nameptr :=
      s #1 "{vv~}{ll}" format.name$
			{ namesleft #0 > }
			{ 	nameptr numnames =
	    			{ s nameptr "{ff }{vv }{ll}{ jj}" format.name$ "others" =
						{ " et~al." * }
						{ " and " * s nameptr "{vv~}{ll}" format.name$ * }
	      			  if$
	    			}
	    			{ ", " * s nameptr "{vv~}{ll}" format.name$ * }
	  			if$
	  			nameptr #1 + 'nameptr :=
	 			namesleft #1 - 'namesleft :=
			}
      while$
    }
  if$
}


FUNCTION {format.lab.names.number}
{ remove.braces 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ vv }{ ll }{ f }{ jj }" format.name$ 't :=
      
       t sortify * "  " *
	     	  nameptr #1 + 'nameptr :=
  	    	namesleft #1 - 'namesleft :=
    }
  while$}

FUNCTION {format.lab.names.alpha}
{ 's :=
  s num.names$ 'numnames :=
  numnames #1 >
    { numnames #4 >
	{ #3 'namesleft := }
	{ numnames 'namesleft := }
      if$
      #1 'nameptr :=
      ""
	{ namesleft #0 > }
	{ nameptr numnames =
	    { s nameptr "{ff }{vv }{ll}{ jj}" format.name$ "others" =
		{ "+" *
		  #1 'et.al.char.used :=
		}
		{ s nameptr "{v{}}{l{}}" format.name$ * }
	      if$
	    }
	    { s nameptr "{v{}}{l{}}" format.name$ * }
	  if$
	  nameptr #1 + 'nameptr :=
	  namesleft #1 - 'namesleft :=
	}
      while$
      numnames #4 >
	{ "+" *
	  #1 'et.al.char.used :=
	}
	'skip$
      if$
    }
    { s #1 "{v{}}{l{}}" format.name$
      duplicate$ text.length$ #2 <
	{ pop$ s #1 "{ll}" format.name$ #3 text.prefix$ }
	'skip$
      if$
    }
  if$
}
FUNCTION {format.lab.names}{
	"type=nameyear" is.in.list
		'format.lab.names.nameyear
		{
			"type=alpha" is.in.list
				'format.lab.names.alpha
				'format.lab.names.number
			if$
		}
	if$
}
FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.organization.label
        { type$ "manual" =
            'author.key.organization.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list

  "type=alpha" is.in.list
  {
    duplicate$
    year field.or.null purify$ #-1 #2 substring$
    *
    'label :=
    year field.or.null purify$ #-1 #4 substring$
    *
    sortify 'sort.label :=
  }
  {
    "("
    *
    year duplicate$ empty$
    short.list key field.or.null = or
      { pop$ "" }
      'skip$
    if$
    *
    'label :=
    label 'sort.label :=
  } 
  if$
}

FUNCTION {sort.format.names.nameyear}
{ remove.braces 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    {% nameptr #1 >
     %   { "   " * numnames int.to.str$ * "   " *}
     %   'skip$
     % if$
      s nameptr "{vv }{ll}" format.name$ 't :=
      nameptr numnames = 
      t "others" = 
      and
        { "et al" * }
        { t sortify * "  " *
      		#3 numnames  =
        	#2 numnames  =
        	or
        	#2 nameptr  =
          and
        	  {year empty$
        	     'skip$
        	     {year * "  " *}
        	   if$  
        	  }
        	  'skip$
          if$
        }
      if$
		#3 numnames  <
  			{#0 'namesleft :=
  				 	"zzz   " *
  			}    
	      {
	     	  nameptr #1 + 'nameptr :=
  	    	namesleft #1 - 'namesleft :=
  	    }
  	  if$  	
    }
  while$
}

FUNCTION {sort.format.names.number}
{ remove.braces 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{vv }{ll }{f }{jj}" format.name$ 't :=
    	nameptr numnames = 
      t "others" = 
      and
        { "et al" * }
        { t sortify * "  " *}
      if$
   	  	nameptr #1 + 'nameptr :=
    	namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.names.alpha}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
        { "   " * }
        'skip$
      if$
      s nameptr "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}" format.name$ 't :=
      nameptr numnames = 
      t "others" = 
      and
        { "et al" * }
        { t sortify * }
      if$
  	  	nameptr #1 + 'nameptr :=
   		namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.names}{
	"type=nameyear" is.in.list
		'sort.format.names.nameyear
		{
			"type=alpha" is.in.list
				'sort.format.names.alpha
				'sort.format.names.number
			if$
		}
	if$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          "zzz"
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              "z"
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ calc.label
  sort.label sortify
  "    "
  *
  type$ "book" =
  type$ "inbook" =
  or
 		{author empty$
   		'editor.organization.sort
      'author.organization.sort
     if$
    }
    { type$ "proceedings" =
      type$ "incollection" =
       or
    		{author empty$
        		'editor.organization.sort
            	'author.organization.sort
        if$
        }
        { type$ "manual" =
          type$ "misc" =
          or
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  %%%% removing title from the sorting line 
  %title field.or.null sort.format.title
  %*
  #1 entry.max$ substring$ 'sort.label :=
%  sort.label top$
  sort.label *
  #1 entry.max$ substring$ 'sort.key$ :=
  
  %sort.key$ top$
}

ITERATE {presort}

FUNCTION {bib.sort.order}
{ 
  "settings" type$ =
  	{"aaa"}
  	{"sort=0" is.in.list
    	{"bb"}
    	{"type=alpha" is.in.list
    		{sort.key$}
    		{sort.label}
      	if$  
   		}
  	 if$
  	}
  	if$
  'sort.key$ :=
	%sort.key$ top$ 
}

ITERATE {bib.sort.order}

SORT


INTEGERS { longest.label.width last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'j :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label "l" change.case$ label "l" change.case$ =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ j "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'j :=
  label extra.label * 'label :=
  %label top$
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}


FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
    "\begin{thebibliography}{" number.label int.to.str$ * "}" * write$ newline$
	"% BibTex style file: imsart-nameyear.bst, 2017-11-03" write$ newline$
	default.option.string "" =
		'skip$
		{ 
			"% Default style options (" default.option.string * ")." * write$ newline$
			"% Used options (" list.string * ")." * write$ newline$
		}
	if$
	
}
EXECUTE {begin.bib}

EXECUTE {init.state.consts}


ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
 "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
