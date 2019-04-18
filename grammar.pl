use v6;

unit grammar Jq;

rule TOP { <filter>+ % '|' }

rule bare-list                           { <filter>+                         }
rule comma-list                          { <filter>+     % ','               }
rule pipe-list                           { <comma-list>+ % '|'               }

proto token filter                       { *                                 }
multi token filter:sym<dot>              { '.'                               }
multi token filter:sym<basicbare>        { '.' (\w+) '?'?                    }
multi token filter:sym<basic<quote>      { '.' ['[' <string> ']' '?'?        }
multi token filter:sym<arrayindex>       { '.' '[' <number> ']'              }
multi token filter:sym<arrayslice>       { '.' '[' <number> ':' <number> ']' }
multi token filter:sym<valueiterator>    { '.' '[' ']' '?'?                  }
multi token filter:sym<recursivedescent> { '.' '.'                           }
