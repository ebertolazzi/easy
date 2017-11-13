package main;

sub do_cmd_Email {
    local($_) = @_;
    s/$next_pair_pr_rx// ;
    my $email = $2 ;
    join('',"<A HREF=\"mailto:", $email,"\">", $email, "</A>", $_) ;
}

sub do_env_desc {
  local($_) = @_;

  #RRM - catch nested lists
  $_ = &translate_environments($_);
  
  my $dotlist = "\n<P><DL>\n" ;
  
  $* = 1 ;
  my @items = split(/\\item\b/,$_) ;
  $* = 0 ;

  # prepend each item with an item label: \item => \item[<label>]
  shift(@items) ;
  foreach my $item (@items) {
    #$item =~ s/^\s*\[([^]]*)\]// ;
    $item =~ s/^\s*\[(.*)\]\s// ;
    local($ICONSERVER) = ($LOCAL_ICONS ? '' : $ICONSERVER.$dd );
    my $icon = 'BlueBall' ;
    my $size = $ImageSizeMarks{$icon} ;
    $icon = "$ICONSERVER$ImageMarks{$icon}.$IMAGE_TYPE" ;
    $used_icons{$icon} = 1 ;
    my $the_item = join('',"<IMG ",$size," SRC=\"", $icon,"\" ALT=\"*\">") ;
    if ( $1 ) {
      $the_item = join('', $the_item, " <B>", &translate_environments($1), "</B>") ;
    }
    $dotlist = join('', $dotlist, "\n<DT>", $the_item,"<DD>", $item, "<P>" ) ;
  }
  
  join('', $dotlist, "\n</DL><P>\n") ;
}


sub do_env_dotlist {
  local($_) = @_;
  
  #RRM - catch nested lists
  $_ = &translate_environments($_);
  
  my $dotlist = "<P><div ALIGN=\"LEFT\"><table WIDTH=\"100%\" CELLPADDING=\"3\" BORDER=\"0\">\n" ;
  
  $* = 1 ;
  my @items = split(/\\item\b/,$_) ;
  $* = 0 ;
  
  my $first_item ;

  # prepend each item with an item label: \item => \item[<label>]
  shift(@items) ;
  foreach my $item (@items) {
    $item =~ s/^\s*\[([^]]*)\]// ;
    if ( $1 ) {
      $first_item = &translate_environments($1) ;
    } else {
      local($ICONSERVER) = ($LOCAL_ICONS ? '' : $ICONSERVER.$dd );
      my $icon = 'BlueBall' ;
      my $size = $ImageSizeMarks{$icon} ;
      $icon = "$ICONSERVER$ImageMarks{$icon}.$IMAGE_TYPE" ;
      $used_icons{$icon} = 1 ;
      $first_item = join('',"<IMG ",$size," SRC=\"", $icon,"\" ALT=\"*\">") ;
    }
    $dotlist = join('', $dotlist, 
		    "<TR><TD WIDTH=\"3%\" ALIGN=\"LEFT\" VALIGN=\"TOP\">",
		    $first_item, "</TD>\n",
		    "<TD WIDTH=\"97%\" ALIGN=\"LEFT\" VALIGN=\"TOP\">",
		    $item, "</TD></TR>\n") ;
  }
  
  join('', $dotlist, "</table><div><P>\n") ;
}

sub do_cmd_CIRC {
  local($_) = @_ ;
  local($ICONSERVER) = ($LOCAL_ICONS ? '' : $ICONSERVER.$dd );
  my $icon = 'RedBall' ;
  my $size = $ImageSizeMarks{$icon} ;
  $icon = "$ICONSERVER$ImageMarks{$icon}.$IMAGE_TYPE" ;
  $used_icons{$icon} = 1 ;
  join('',"<IMG ",$size," SRC=\"", $icon,"\" ALT=\"*\">", $_) ;
}
# 
sub do_cmd_BULLET {
  local($_) = @_ ;
  local($ICONSERVER) = ($LOCAL_ICONS ? '' : $ICONSERVER.$dd );  
  my $icon = 'BlueBall' ;
  my $size = $ImageSizeMarks{$icon} ;
  $icon = "$ICONSERVER$ImageMarks{$icon}.$IMAGE_TYPE" ;
  $used_icons{$icon} = 1 ;
  join('',"<IMG ",$size," SRC=\"", $icon,"\" ALT=\"*\">", $_) ;
}

@key_LATEX = ("begin", "def", "documentclass", "else", "end", "if",
              "let", "left", "right", "usepackage", "expandafter", "noexpand",
	      "bgroup", "egroup", "qquad", "quad", "setbox", "hbox", "fbox",
	      "nabla", "rho", "mbox", "subset", "partial",
	      "Omega", "cdot", "sum", "bigg", "frac", "sqrt", "label",
	      "matrix", 
	      ) ;
	      
@key_my = ( "bookref", "paperref", "by", "bysame", "title", "transl",
	    "jour", "toappear", "inbook", "publ", "bookinfo",
            "eds", "publaddr", "vol", "year", "pages",
	    "finalinfo", "lang", "endref",
	    "refstyle", "citestyle", "addpath", "first",
	    "aligntop", "alignbottom", "newvector", "newcustomvector",
	    "bibdefinestyles", "bibsetfmt", "moreref", "eqmulticol",
	    "eqlabeltop", "yesnumber", "eqleftmargin", "eqspacing",
	    "eqcolumnsep", "eqrowsep",
	    "dfrac", "tfrac", "binom", "eqbox", "norm", "abs", "ParDer",
	    "DIV", "SUM", "PROD") ;

@end_my = ( "MAT", "BMAT", "EQ", "EQA" ) ;

sub do_LATEX_formatting {
    local($_) = @_ ;

    my $code = $_ ;
  
    $code =~ s/;SPMquot;/\"/g ;
    my @str ;
    my $nstr = 0 ;
    while ( $code =~ s/\"([^\"]*)\"/sprintf("S@%d",$nstr)/sei ) {
	$str[$nstr] = "\"".$1."\"" ;
	$nstr++ ;
    }
    $code =~ s/\"/;SPMquot;/g;

    
    foreach my $key (@key_my) {
	$code =~ s/(\\$key)(\b)/<FONT COLOR="Purple">$1<\/FONT>$2/g ;
    }

    foreach my $key (@key_LATEX) {
	$code =~ s/(\\$key)(\b)/<FONT COLOR="Blue">$1<\/FONT>$2/g ;
    }

    foreach my $key (@end_my) {
	$code =~ s/(\b)($key)(\b)/$1<FONT COLOR="Red">$2<\/FONT>$3/g ;
    }

    #$code =~ s/{/<B>{<\/B>/g ;
    #$code =~ s/}/<B>}<\/B>/g ;
    #$code =~ s/\(/<B>(<\/B>/g ;
    #$code =~ s/\)/<B>)<\/B>/g ;
    #$code =~ s/\[/<B>[<\/B>/g ;
    #$code =~ s/\]/<B>]<\/B>/g ;
    
    while ( $code =~ /S\@(\d)/ ) {
	$code =  $`."<FONT COLOR=\"Green\"><I>".$str[$1]."</I></FONT>".$' ;
    }
    
    $code ;
}

sub do_cmd_inputcode {
  local($_) = @_ ;

  # Read in file, get markup ready.
  my $outer = &do_cmd_verbatiminput;
  
  # Postprocess verbatim content.
  $_ = $verbatim{$global{'verbatim_counter'}};
  
  # eliminate blank lines
  s/( |\t)+\n/\n/g ;

  $_ = &do_LATEX_formatting($_) ;
  
  #add the stuff from the first(if empty) and last line also
  $verbatim{$global{'verbatim_counter'}} = $_ ;
  
  join('',
       "\n<P><div ALIGN=\"CENTER\">",
       "\n  <table BGCOLOR=\"Lavender\" CELLPADDING=3 BORDER=\"1\" WIDTH=\"100%\">",
       "\n  <TR><TD ALIGN=\"LEFT\">\n",
       $outer,
       "\n  </TD></TR>",
       "\n  </table>",
       "\n</div><P>") ;
}

sub do_cmd_VRB {
  &do_cmd_inputcode ;
}

sub do_cmd_FRAMEVRB {
  &do_cmd_inputcode ;
}

sub do_env_BOXED {
  local($_) = @_;
  join('',
       "\n<P><div ALIGN=\"CENTER\">",
       "\n  <table BGCOLOR=\"Lavender\" CELLPADDING=3 BORDER=\"1\" WIDTH=\"100%\">",
       "\n  <TR><TD ALIGN=\"CENTER\">\n",
       $_,
       "\n  </TD></TR>",
       "\n  </table>",
       "\n</div><P>") ;
}

sub do_geometry_a4paper{}
sub do_geometry_oneside{}
sub do_geometry_twoside{}

&ignore_commands( <<_IGNORED_CMDS_);
vspace # {}
hspace # {}
vskip # &ignore_numeric_argument
hskip # &ignore_numeric_argument
kern # &ignore_numeric_argument
Url # {}
overline # {}
definevectors
math
flushbottom
raggedbottom
tolerance # &ignore_numeric_argument 
bullet 
linewidth
figsize
mathbf # {}
mathsf # {}
graphicspath # {}
_IGNORED_CMDS_

&process_commands_in_tex (<<_RAW_ARG_CMDS_);
_RAW_ARG_CMDS_

&process_commands_inline_in_tex (<<_RAW_ARG_CMDS_);
_RAW_ARG_CMDS_

&process_commands_nowrap_in_tex (<<_RAW_ARG_NOWRAP_CMDS_);
_RAW_ARG_NOWRAP_CMDS_

&process_commands_wrap_deferred (<<_RAW_ARG_DEFERRED_CMDS_);
CIRC
BULLET
VRB # {}
FRAMEVRB # {}
BOXED # <<endBOXED>>
mycppn # {}
mycppcn # {}
_RAW_ARG_DEFERRED_CMDS_
 
1;                              # This must be the last line
