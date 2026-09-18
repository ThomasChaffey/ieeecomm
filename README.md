# ieeecomm: community version of ieeecolor

This class is a community version of the ieeecolor.cls class for IEEE journal papers.  It loads the current IEEEtran (V1.8b) and adds the ieeecolor.cls colour-template appearance on top. 

## New features

1. Revision highlighting: `\revised{...}` and `\begin{revision}...\end{revision}`, robust to maths, paragraphs, captions and headings; `\revisionsoff`, `\revisionson`, `norevisions` option.
2. No logo, no `logo.eps`, no shell-escape; compiles on arXiv.
3. All IEEEtran V1.8b commands and options work; old V1.6 names kept as aliases.
4. `xcolor` instead of `color`; `dvipsnames`, `svgnames`, `x11names`, `table` accepted as class options.
5. Defaults for `subsectioncolor`, `\journalname`, `\firstpagerule`, `\logowidth`, `\logoname`: no journal `.sty` needed.
6. `\journalname` sets the running head automatically; `\markboth` overrides.
7. Options `print`, `nocolor`, `noheadrule`; `web` is the default.
8. Works with `caption`, `subcaption` and `subfig`.
9. `\ProvidesClass{ieeecomm}`.
10. Heading sizes follow the size option.

## Bug fixes

1. Colour leaking out of figure captions (`pop empty color page stack`, body text turning blue).
2. Missing "References" heading.
3. Overfull and underfull boxes from the page header on every page.
4. `\thanks` and `\author` not `\long` (blank line inside them was an error).
5. `\everymath={\sf}` setting maths in abstracts, index terms, headings and biographies upright sans.
6. Fake `\NAT@parse` disabling hyperref citation links.
7. `\centerline` in the author line breaking the last author name; `peerreviewca` mode failing.
8. `\if\boldmath` making all table-caption maths bold.
9. Conference mode failing with "Undefined color 'nblue'".
10. `\newdimen\width` allocated at every `\begin{table}`.
11. `\section*` headings off-centre by about 8pt.
12. `proof` clashing with `amsthm`; `\endproof` removing the next paragraph's indent.
13. `print` mode, `oneside` heads and even-numbered first pages broken.
14. `\markboth` bypassing LaTeX's mark mechanism.
15. Non-standard `\DeclareMathSizes` changing script sizes.
16. Malformed `\PackageError` calls, duplicate and dead options, unused editorial-query code.
17. Dependence on the document loading `graphicx`.
18. IEEEtran V1.8b fixes restored: appendix lettering, unbreakable `\thesubsection`, theorem numbering in appendices, footnote rule, `\bstctlcite` optional argument, text-height quantisation.
