% BibTeX standard bibliography style `aea' (one of the harvard family)
	% version 0.99a for BibTeX versions 0.99a or later, LaTeX version 2.09.
	% Copyright (C) 2008, all rights reserved.
    % Melissa Rice (melissa@fmtek.net), Full Moon Technical Solutions, LLC (dba FMTek)
    % last revised: 20 May 2009 

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
	presented
    publisher
    school
    series
    title
    type
    URL
    volume
    year
  }
  { field.used etal.allowed etal.required}
  { extra.label sort.label list.year }

STRINGS { s t f }

% BOOLEAN OPERATORS

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

% CHECKS 

FUNCTION {author.or.editor.check}
{ author empty$ editor empty$ and
    { "empty author and editor in " cite$ * warning$ }
    { skip$ }
	if$
}

FUNCTION {chapter.or.pages.check}
{ chapter empty$ pages empty$ and
    { "empty chapter and pages in " cite$ * warning$  }
    { skip$ }
	if$
}


FUNCTION {required}
{ 't := % name of variable
  empty$ % value of variable on stack
    { "empty " t * " in " * cite$ * warning$ }
    { skip$ }
	if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

% GENERAL FORMATTING

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

FUNCTION {embolden}
{ duplicate$ empty$
    { pop$ "" }
    { "{\bf " swap$ * "}" * }
  if$
}

FUNCTION {quote}
{ duplicate$ empty$
    { pop$ "" }
    { "`" swap$ * "'" * }
  if$
}

FUNCTION {doublequote}
{ duplicate$ empty$ 
    { pop$ "" }
    { "``" swap$ * "''" * }
  if$
}

FUNCTION {join}
{  't := % second string
   'f := % join character
   's := % first string
   s empty$
	 { t empty$ 
	   { "" }
       { t }	   
	   if$
	 } 
     { t empty$
	   { s }
	   { f ". " =
	     { s add.period$ " " * t * }
	     { s f * t * }
		 if$
		} 
	   if$
	 }  
	 if$
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
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

INTEGERS { ind tsslen }

STRINGS { tss ret rss istr }

FUNCTION {replace.substring}{
  'rss :=
  'tss :=
  'istr :=
  "" 'ret :=
  tss text.length$ 'tsslen :=
  #1 'ind :=
    { istr ind tsslen substring$ "" = not }
    { istr ind tsslen substring$ tss =
        { ret rss * 'ret :=
          ind tsslen + 'ind :=
        }
        { ret istr ind #1 substring$ * 'ret :=
          ind #1 + 'ind :=
        }
      if$
    }
  while$
  ret
}

FUNCTION {n.dashify}
{ 't :=
  ""
  { t empty$ not }
    { t #1 #1 substring$ "-" =
	  { t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    { { t #1 #1 substring$ "-" = }
	        { "-" *
	        t #2 global.max$ substring$ 't :=
		    }
	        while$
	    }
	    if$
	  }
	  { t #1 #1 substring$ *
	    t #2 global.max$ substring$ 't :=
	  }
      if$
    }
    while$
}

INTEGERS { multiresult }

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


% OUTPUT FUNCTIONS

FUNCTION {output} % writ
{ duplicate$ empty$
  { pop$ }
  { write$}
  if$
}

FUNCTION {output.year} % writ
{ list.year empty$
  { skip$ }
  { list.year ". " * write$}
  if$
}

FUNCTION {output.title.quoted}
{ title empty$
    { skip$ }
	{ title add.period$ doublequote " " * write$ }
	if$
}

FUNCTION {output.title.italic}
{ title empty$
    { skip$ }
	{ title add.period$ emphasize " " * write$ }
	if$
}

FUNCTION {output.entry}
{ duplicate$ "" = 
    { pop$ }
    { add.period$
      write$
    }
    if$
  newline$ 
}

% FIELD FORMATTING

FUNCTION {format.address.only}
{ address empty$
    { "" }
	{ address }
	if$
}

FUNCTION {format.journal}
{ journal empty$
    { "" }
	{ journal emphasize }
    if$
}

FUNCTION {format.type}
{ type empty$
    { "" }
	{ type }
    if$
}

FUNCTION {format.number}
{ number empty$
    { "" }
	{ number }
    if$
}


FUNCTION {format.school}
{ school empty$
    { "" }
	{ school }
    if$
}

FUNCTION {format.institution}
{ institution empty$
    { "" }
	{ institution }
    if$
}

FUNCTION {format.masters}
{ "Master's diss."
}

FUNCTION {format.phd}
{ "PhD diss."
}

FUNCTION {format.note}
{ note empty$
    { "" }
	{ note }
	if$
}

FUNCTION {format.booktitle}
{ booktitle empty$
    { "" }
	{ booktitle emphasize }
    if$
}

FUNCTION {format.booktitle.label}
{ booktitle empty$
    { "" }
	{ booktitle embolden }
    if$
}

FUNCTION {format.title.bold}
{ title empty$
    { "" }
    { title add.period$ embolden }
	if$
}

FUNCTION {format.month}
{ month empty$
    { "" }
	{ month }
	if$
}

FUNCTION {format.vol.num.pages} % writ
{ volume empty$
    { number empty$
      {""}
      { "there's a number but no volume in " cite$ * warning$ ", (" number * ")" *}
	  if$
    }
    { number empty$
      { volume }
      { volume "(" * number * ")" *}
      if$
    }
    if$
  pages empty$
    { skip$ }
    { duplicate$ "" =
	  { pages n.dashify * }
	  { ":~" * pages n.dashify * }
	  if$
	}
    if$
}

FUNCTION {format.edition} % writ
{ edition empty$
    { "" }
	{ edition " ed." * }
    if$
}

FUNCTION {format.book.vol.series.ed} % writ
{ volume empty$
    { series empty$
	  { "" }
	  { series emphasize }
	  if$
	}  
    { "Vol." volume tie.or.space.connect
      series empty$
	    'skip$
	    { " of " * series emphasize * }
        if$
    }
    if$
  edition empty$
    { skip$ }
    { ". " * edition * " ed." *}
    if$	
}

FUNCTION {format.address.publisher} % writ
{ address empty$
    { publisher empty$
	  { "" }
	  { publisher }
	  if$
    }
	{ publisher empty$
	  { address }
	  { address ":" * publisher *}
	  if$
	}
	if$
}

FUNCTION {format.howpublished}
{ howpublished empty$
    { "" }
	{ howpublished emphasize }
    if$
}

FUNCTION {format.organization}
{ organization empty$
    { "" }
	{ organization }
    if$
}

FUNCTION {format.organization.presented}
{ organization empty$
    { "" }
	{ presented empty$
	  { organization }
	  { presented " " * organization * }
	  if$
	} 
    if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
	  { pages n.dashify }
	  { pages }
      if$
    }
    if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    { pages empty$ 
	    { "" }
	    { format.pages  }
	    if$
	}	
	{ pages empty$ 
	    { "Chapter " chapter * }
	    { "Chapter " chapter * ", " * format.pages * }
	    if$
	}	
	if$
}

INTEGERS { nameptr namesleft numnames }

% Format names so that first author is "last, first" and subsequent authors are "first last" with commas 
% separating authors whenever there are two or more and "and" precedes last author if 2 or more.
FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  { namesleft #0 > }
    { nameptr #1 = 
	    {	s nameptr "{vv~}{ll}{, jj}{, ff}" format.name$ 't := }
	    {	s nameptr "{ff }{vv~}{ll}{, jj}" format.name$ 't := }
	    if$
      nameptr #1 >
	    { namesleft #1 >
	      { ", " * t * }
	      { t "others" =
		    { ", et~al." * }
		    { ", and " * t * }
	        if$
	      }
	      if$
	    }
	    't
        if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
    while$
}

FUNCTION {format.names.forward}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  { namesleft #0 > }
    { s nameptr "{ff }{vv~}{ll}{, jj}"  format.name$ 't := 
      nameptr #1 >
	    { namesleft #1 >
	        { ", " * t * }
	        { t "others" =
		      { " et~al." * }
		      { " and " * t * }
	          if$
	        }
	        if$
	    }
	    't
        if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
    while$
}

INTEGERS { author.field editor.field organization.field title.field key.field }

FUNCTION {init.field.constants}
{ #0 'author.field :=
  #1 'editor.field :=
  #2 'organization.field :=
  #3 'title.field :=
  #4 'key.field :=
}



FUNCTION {format.names.label}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  { namesleft #0 > }
    { s nameptr "{ff }{vv~}{ll}{, jj}"  format.name$ 't := 
      nameptr #1 >
	    { namesleft #1 >
	        { ", " * t * }
	        { t "others" =
		      { " et~al." * }
		      { " \harvardand\ " * t * }
	          if$
	        }
	        if$
	    }
	    't
        if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
    while$
}

FUNCTION {format.names.label.short}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames #3 >
    { s #1 "{vv~}{ll}" format.name$ " et~al." *}
	{ numnames 'namesleft :=
      { namesleft #0 > }
        { s nameptr "{vv~}{ll}"  format.name$ 't := 
          nameptr #1 >
	        { namesleft #1 >
    	        { ", " * t * }
	            { t "others" =
		          { " et~al." * }
		          { " \harvardand\ " * t * }
    	          if$
	            }
	            if$
    	    }
	        't
            if$
          nameptr #1 + 'nameptr :=
          namesleft #1 - 'namesleft :=
        }
      while$
	}
	if$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names add.period$ embolden}
    if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names add.period$ embolden}
    if$
}

FUNCTION {format.editors.primary}
{ editor empty$
    { "" }
    { editor format.names ", " * embolden " ed" *}
    if$
}

FUNCTION {format.editors.secondary}
{ editor empty$
    { "" }
    { ", ed. " editor format.names.forward *}
    if$
}

FUNCTION {make.list.label} % writ
{ author.field field.used =
    { format.authors }
    { editor.field field.used =
        { format.editors.primary }
        { organization.field field.used =
            { "The " #4 organization chop.word embolden }
            { title.field field.used =
                { format.title.bold }
                { key.field field.used =
                    { key }
                    { "Internal error :001 on " cite$ * " label" * warning$ }
                    if$
                }
                if$
            }
            if$
        }
        if$
    }
    if$
}

FUNCTION {output.list.label} % writ
{ make.list.label add.period$ " " * write$
}

FUNCTION {make.label.short}  % writ
{ author.field field.used =
    { author format.names.label.short }
    { editor.field field.used =
        { editor format.names.label.short }
        { organization.field field.used =
            { "The " #4 organization chop.word}
            { title.field field.used =
                { format.booktitle.label }
                { key.field field.used =
                    { key }
                    {"Internal error :001 on " cite$ * " label" * warning$ }
                    if$
                }
                if$
            }
            if$
        }
        if$
    }
    if$
}

FUNCTION {make.label.full} % writ 
{ author.field field.used =
    { author format.names.label }
    { editor.field field.used =
        { editor format.names.label }
        { organization.field field.used =
            { "The " #4 organization chop.word}
            { title.field field.used =
                { format.booktitle.label }
                { key.field field.used =
                    { key }
                    {"Internal error :001 on " cite$ * " label" * warning$ }
                    if$
                }
                if$
            }
            if$
        }
        if$
    }
    if$
}

% bibitem syntax:
% \harvarditem[abbr-citation]{full-citation}{citation-year}{cite-key}
% abbr-citation: names for 2nd and subsequent citations
% full-citation: names for 1st citation

% Give full name (first name, middle initial, and last name) of author(s) and year of publication in the first citation.
% Give the last name of author and year of publication in parentheses for each subsequent citation. 
% If there are four or more authors, refer to the first author, followed by et al. and the year. 

FUNCTION {output.bibitem} % writ
{ newline$
  "\harvarditem[" make.label.short * "]" * 
  "{" make.label.full * "}" * *
  "{" list.year * "}" * *
  "{" cite$ * "}" * * write$
  newline$
}

FUNCTION {stack.show}
{ duplicate$ "stack top: " swap$ * " in " * cite$ * warning$ 
  duplicate$ "" =
    { "stack top is blank" warning$ }  
    { "stack top is non-blank" warning$ }  
	if$
}
FUNCTION {article} % writ
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.quoted
  author "author" required
  title "title" required
  journal "journal" required
  year "year" required
  format.journal ", " 
%  format.month join ", " 
  format.vol.num.pages join ". "
  format.note join 
  output.entry
}

FUNCTION {book}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.italic
  author.or.editor.check
  title "title" required
  publisher "publisher" required
  year "year" required
%  format.month ", "
%  format.book.vol.series.ed join ", "
  format.book.vol.series.ed ", "
  format.address.publisher join ". "
  format.note join
  output.entry
}


FUNCTION {booklet}
{ output.bibitem
  output.list.label % write author or surrogate label
  year empty$
    { skip$ }
    { output.year }
	if$
  author empty$
	{ skip$ }
    { output.title.quoted }
	if$
  title "title" required
  format.howpublished ", "
%  format.month join ", "
  format.address.only join ". "
  format.note join
  output.entry
}

FUNCTION {inbook}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.quoted
  author.or.editor.check
  chapter.or.pages.check
  title "title" required
  publisher "publisher" required
  year "year" required
  format.booktitle ", "
  format.editors.secondary join " "
  format.book.vol.series.ed join ", "
  format.chapter.pages join ". "
  format.address.publisher join ". "
  format.note join
  output.entry
}

FUNCTION {incollection}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.quoted
  "In " format.booktitle * ". " * output
  author "author" required
  title "title" required
  booktitle "booktitle" required
  publisher "publisher" required
  year "year" required
  format.book.vol.series.ed ", " 
  format.editors.secondary join ", "
  format.chapter.pages join ". " 
  format.address.publisher join ". "
  format.note join
  output.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.quoted
  author "author" required
  title "title" required
  booktitle "booktitle" required
  year "year" required
  format.book.vol.series.ed ", "
  format.pages join ", "
  format.organization.presented join ". "
  format.address.publisher join ". "
  format.note join
  output.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  output.list.label % write author or surrogate label
  title "title" required
  year empty$
    { skip$ }
    { output.year }
	if$
  author empty$
	{ skip$ }
    { output.title.quoted }
	if$
  format.edition ", "
  format.address.only join ", "
  format.organization join ", "
%  format.month join ", "
  format.note join
  output.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.quoted
  author "author" required
  title "title" required
  school "school" required
  year "year" required
  format.masters " "
  format.school join ", "
  format.address.only join ", "
%  format.month join ", "
  format.note join
  output.entry
}

FUNCTION {misc}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  author empty$
	{ skip$ }
    { output.title.quoted }
	if$
  format.howpublished ", "
%  format.month join ". "
  format.note join
  output.entry
}

FUNCTION {phdthesis}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.quoted
  author "author" required
  title "title" required
  school "school" required
  year "year" required
  format.phd " "
  format.school join ", "
  format.address.only  join ", "
%  format.month join ". "
  format.note join
  output.entry
}

FUNCTION {proceedings}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  title "title" required
  year "year" required
  editor empty$ organization empty$ and
	{ skip$ }
    { output.title.quoted }
	if$
  editor empty$ 
	{ "" "" }
    { format.organization  ", " }
	if$
  format.address.publisher join ", "
  format.note join
  output.entry
}

FUNCTION {techreport}
{ output.bibitem
  output.list.label % write author or surrogate label
  output.year
  output.title.quoted
  author "author" required
  title "title" required
  institution "institution" required
  year "year" required
  format.institution  " "
  format.type join " "
  format.number join ", "
%  format.month join ", "
  format.address.publisher join ". "
  format.note join
  output.entry
}

FUNCTION {unpublished}
{ output.bibitem
  output.list.label % write author or surrogate label
  year empty$
    { skip$ }
    { output.year }
	if$
  output.title.quoted
  author "author" required
  title "title" required
  note "note" required
  format.note
  output.entry
}


FUNCTION {default.type} { misc }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

READ

EXECUTE {init.field.constants}

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

FUNCTION {sortify.names}
{ " \harvardand\ " " " replace.substring
  " et~al." " zzz" replace.substring
  sortify
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ title.field 'field.used := }
	{ key.field 'field.used := }
      if$
    }
    { author.field 'field.used := }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { title.field 'field.used := }
	    { key.field 'field.used := }
	  if$
  	}
	{ editor.field 'field.used := }
      if$
    }
    { author.field 'field.used := }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
	{ organization empty$
	    { title.field 'field.used := }
	    { organization.field 'field.used := }
	  if$
	}
	{ key.field 'field.used := }
      if$
    }
    { author.field 'field.used := }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
	{ organization empty$
	    { title.field 'field.used := }
	    { organization.field 'field.used := }
	  if$
	}
	{ key.field 'field.used := }
      if$
    }
    { editor.field 'field.used := }
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

FUNCTION {calc.label} 
{ make.label.short
  title.field field.used =
    { sort.format.title }
    { sortify.names }
  if$
  year field.or.null purify$ #-1 #4 substring$ sortify
  *
  'sort.label :=
}

FUNCTION {preliminaries} 
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
  author.field field.used = 
    {
      author num.names$ #2 >
        { #1 }
        { #0 }
      if$
      'etal.required :=
    }
    {
      editor.field field.used = 
        {
          editor num.names$ #2 >
            { #1 }
            { #0 }
          if$
        }
        { #0 }
      if$
      'etal.required :=
    }
  if$
  #1 'etal.allowed :=
}

FUNCTION {first.presort}
{ calc.label
  sort.label
  title.field field.used =
    { skip$ }
    { "    "
      *
      make.list.label sortify.names
      *
      "    "
      *
      title field.or.null
      sort.format.title
      *
    }
  if$
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {preliminaries}

ITERATE {first.presort}

SORT

STRINGS { last.sort.label next.extra last.full.label}

INTEGERS { last.extra.num last.etal.allowed}

FUNCTION {initialize.confusion}
{ #0 int.to.chr$ 'last.sort.label :=
  #0 int.to.chr$ 'last.full.label :=
  #1 'last.etal.allowed :=
}

FUNCTION {confusion.pass}
{ last.sort.label sort.label =
    { last.etal.allowed 
        { last.full.label make.label.full sortify.names =
            { skip$ }
            { #0 'etal.allowed :=
              #0 'last.etal.allowed :=
            }
          if$
        }
        { #0 'etal.allowed := }
      if$
    }
    { sort.label 'last.sort.label :=
      make.label.full sortify.names 'last.full.label :=
      #1 'last.etal.allowed :=
    }
  if$
}

EXECUTE {initialize.confusion}

ITERATE {confusion.pass}

EXECUTE {initialize.confusion}

REVERSE {confusion.pass}

FUNCTION {initialize.last.extra.num}
{ #0 int.to.chr$ 'last.sort.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
}

FUNCTION {forward.pass}
{ last.sort.label sort.label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      sort.label 'last.sort.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  year empty$
    { "n.d." extra.label emphasize * 'list.year := }
    { year extra.label emphasize * 'list.year := }
  if$
  extra.label 'next.extra :=
}

ITERATE {first.presort}

SORT

EXECUTE {initialize.last.extra.num}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {second.presort}
{ make.list.label
  title.field field.used =
    { sort.format.title }
    { sortify.names }
  if$
  "    "
  *
  list.year field.or.null sortify
  *
  "    "
  *
  title.field field.used =
    { skip$ }
    { title field.or.null
      sort.format.title
      *
    }
  if$
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {second.presort}

SORT

FUNCTION {begin.bib}
{ newline$ newline$ "% Bibstyle aea.bst version 2009.05.20" write$ newline$ newline$
  preamble$ empty$
    'skip$
    { "\harvardpreambledefs{%" write$ newline$
      preamble$ write$ "}" write$ newline$
      "\harvardpreambletext{%" write$ newline$
      preamble$ write$ "}" write$ newline$ }
  if$
  "\begin{thebibliography}{xx}" write$ newline$
}

EXECUTE {begin.bib}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}

