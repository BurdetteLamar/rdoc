# \Class \RDoc::MarkupReference exists only to provide a suitable home
# for a reference document for \RDoc markup.
#
# All objects defined in this class -- classes, modules, methods, aliases,
# attributes, and constants -- are solely for illustrating \RDoc markup,
# and have no other legitimate use.
#
# = \RDoc Markup Reference
#
# \RDoc-generated documentation is derived from and controlled by:
#
# - Single-line or multi-line comments that precede certain definitions.
# - \RDoc directives in trailing comments (on the same line as code).
# - The Ruby code itself.
#
# == Markup in Comments
#
# A single-line or multi-line comment that immediately precedes
# the definition of a class, module, method, alias, constant, or attribute
# becomes the documentation for that defined object.
#
# (\RDoc ignores other such comments that do not precede definitions.)
#
# === Margins
#
# In a multi-line comment,
# \RDoc looks for the comment's natural left margin,
# which becomes the <em>base margin</em> for the comment
# and is the initial <em>current margin</em> for for the comment.
#
# The current margin can change, and does so, for example,
# in a list.
#
# === Blocks
#
# It's convenient to think of markup input as a sequence of _blocks_,
# each of which is one of:
#
# - Paragraph
# - Verbatim text block
# - Code block
# - Bullet list
# - Numbered list
# - Lettered list
# - Labeled list
# - Heading
# - Horizontal rule
# - Directive
#
# All of these except a paragraph block are specially marked,
# usually by indentation or a special beginning.
#
# ==== Paragraphs
#
# A paragraph consists of one or more non-empty lines of ordinary text,
# each beginning at the current margin.
#
# Note: Here, <em>ordinary text</em> means text that is <em>not identified</em>
# as some different kind of block.
# The identifier usually involves indentation,
# or one or more leading or embedded characters. See below.
#
# Paragraphs are separated by one or more empty lines
# beginning at the current margin.
#
# Input:
#
#   \RDoc produces HTML and command-line documentation for Ruby projects.
#   \RDoc includes the rdoc and ri tools for generating and displaying
#   documentation from the command-line.
#
#   You'll love it.
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# \RDoc produces HTML and command-line documentation for Ruby projects.
# \RDoc includes the rdoc and ri tools for generating and displaying
# documentation from the command-line.
#
# You'll love it.
# ---
#
# A paragraph may contain nested blocks, including:
#
# - Verbatim text blocks.
# - Code blocks.
# - Lists of any type.
#
# ==== Verbatim Text Blocks
#
# Text indented farther than the current margin becomes a <em>verbatim text block</em>
# (or a code block, described next).
# In the rendered HTML, such text:
#
# - Is indented.
# - Has a contrasting background color.
#
# The verbatim text block ends at the first line beginning at the current margin.
#
# Input:
#
#   This is some verbatim text.
#     Whitespace is honored.     # See?
#       Whitespace is honored.     # See?
#
#   This is still the same verbatim text block.
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# This is some verbatim text.
#   Whitespace is honored.     # See?
#     Whitespace is honored.     # See?
#
#  This is still the same verbatim text block.
# ---
#
# ==== Code Blocks
#
# A special case of verbatim text is the <em>code block</em>,
# which is merely verbatim text that \RDoc recognizes as Ruby code:
#
# In the rendered HTML, the code block:
#
# - Is indented.
# - Has a contrasting background color.
# - Has syntax highlighting.
#
# Example:
#
#   def foo(name = '', value = 0)
#     @name = name      # Whitespace is still honored.
#     @value = value
#   end
#
# Pro tip:  If your indented Ruby text does not get highlighted,
# it may contain a syntax error.
#
# ==== Lists
#
# Each type of list item is marked by a special beginning:
#
# - Bullet list item :: Begins with a hyphen or asterisk.
# - Numbered list item :: Begins with digits and a period.
# - Lettered list item :: Begins with an alphabetic character and a period.
# - Labeled list item :: Begins with one of:
#   - Square-bracketed text.
#   - A word followed by two colons.
#
# A list begins with a list item and continues, even across blank lines,
# as long as list items of the same type are found at the same indentation level.
#
# A new list resets the current margin inward.
# Additional lines of text aligned at that margin
# are part of the continuing list item.
#
# A list item may be continued on additional lines that are aligned
# with the first line.  See examples below.
#
# ===== Bullet Lists
#
# A bullet list item begins with a hyphen or asterisk.
#
# Input:
#
#   - An item.
#   - Another.
#   - An item spanning
#     multiple lines.
#
#   * Yet another.
#   - Last one.
#
# Rendered HTML:
#
# - An item.
# - Another.
# - An item spanning
#   multiple lines.
#
# * Yet another.
# - Last one.
#
# ===== Numbered Lists
#
# A numbered list item begins with digits and a period.
#
# The items are automatically re-numbered.
#
# Input:
#
#   100. An item.
#   10. Another.
#   1. An item spanning
#      multiple lines.
#
#   1. Yet another.
#   1000. Last one.
#
# Rendered HTML:
#
# 100. An item.
# 10. Another.
# 1. An item spanning
#    multiple lines.
#
# 1. Yet another.
# 1000. Last one.
#
# ===== Lettered Lists
#
# A numbered list item begins with a letters and a period.
#
# The items are automatically "re-lettered."
#
# Input:
#
#   z. An item.
#   y. Another.
#   x. An item spanning
#      multiple lines.
#
#   x. Yet another.
#   a. Last one.
#
# Rendered HTML:
#
# z. An item.
# y. Another.
#
# x. Yet another.
# a. Last one.
#
# ===== Labeled Lists
#
# A labeled list item begins with one of:
#
# - Square-bracketed text: the label and text are on two lines.
# - A word followed by two colons: the label and text are on the same line.
#
# Input:
#
#   [foo] An item.
#   bat:: Another.
#   [bag] An item spanning
#         multiple lines.
#
#   [bar baz] Yet another.
#   bam:: Last one.
#
# Rendered HTML:
#
# [foo] An item.
# bat:: Another.
# [bag] An item spanning
#       multiple lines.
#
# [bar baz] Yet another.
# bam:: Last one.
#
# ===== Blocks Nested in Lists
#
# A list item may contain nested blocks, including:
#
# - Paragraphs.
# - Verbatim text blocks.
# - Code blocks.
# - Other lists of any type.
#
# ==== Headings
#
# A heading begins with up to six equal-signs, followed by heading text.
# Whitespace between those and the heading text is optional.
#
# Input:
#
#   = Section 1
#   == Section 1.1
#   === Section 1.1.1
#   === Section 1.1.2
#   == Section 1.2
#   = Section 2
#   = Foo
#   == Bar
#   === Baz
#   ==== Bam
#   ===== Bat
#   ====== Bad
#   ============Still a Heading (Level 6)
#   \== Not a Heading
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# = Section 1
# == Section 1.1
# === Section 1.1.1
# === Section 1.1.2
# == Section 1.2
# = Section 2
# = Foo
# == Bar
# === Baz
# ==== Bam
# ===== Bat
# ====== Bad
# ============Still a Heading (Level 6)
# \== Not a Heading
# ---
#
# ==== Horizontal Rules
#
# A horizontal rule begins with three or more hyphens.
#
# Input:
#
#   ---
#   Stuff between.
#
#   \-- Not a horizontal rule.
#
#   -- Also not a horizontal rule (actually a list item beginning with a hyphen).
#
#   ----
#
# Rendered HTML:
#
# ---
# Stuff between.
#
# \-- Not a horizontal rule.
#
# -- Also not a horizontal rule (actually a list item beginning with a hyphen).
#
# ----
#
# === Text Markup
#
# Text in a paragraph, list item (any type), or heading
# may have markup formatting.
#
# ==== Italic
#
# A single word may be italicized by prefixed and suffixed underscores.
#
# Input:
#
#   _Word_ in paragraph.
#   - _Word_ in bullet list item.
#   1. _Word_ in numbered list item.
#   a. _Word_ in lettered list item.
#   [_word_] _Word_ in labeled list item.
#   ====== _Word_ in heading
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# _Word_ in paragraph.
# - _Word_ in bullet list item.
# 1. _Word_ in numbered list item.
# a. _Word_ in lettered list item.
# [_word_] _Word_ in labeled list item.
# ====== _Word_ in heading
# ---
#
# Any text may be italicized via HTML tag +i+ or +em+.
#
# Input:
#
#   <i>Two words</i> in paragraph.
#   - <i>Two words</i> in bullet list item.
#   1. <i>Two words</i> in numbered list item.
#   a. <i>Two words</i> in lettered list item.
#   [<i>Two words</i>] <i>Two words</i> in labeled list item.
#   ====== <i>Two words</i> in heading
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# <i>Two words</i> in paragraph.
# - <i>Two words</i> in bullet list item.
# 1. <i>Two words</i> in numbered list item.
# a. <i>Two words</i> in lettered list item.
# [<i>Two words</i>] <i>Two words</i> in labeled list item.
# ====== <i>Two words</i> in heading
# ---
#
# ==== Bold
#
# A single word may be made bold by prefixed and suffixed asterisks.
#
# Input:
#
#   *Word* in paragraph.
#   - *Word* in bullet list item.
#   1. *Word* in numbered list item.
#   a. *Word* in lettered list item.
#   [*word*] *Word* in labeled list item.
#   ====== *Word* in heading
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# *Word* in paragraph.
# - *Word* in bullet list item.
# 1. *Word* in numbered list item.
# a. *Word* in lettered list item.
# [*word*] *Word* in labeled list item.
# ====== *Word* in heading
# ---
#
# Any text may be made bold via HTML tag +b+.
#
# Input:
#
#   <b>Two words</b> in paragraph.
#   - <b>Two words</b> in bullet list item.
#   1. <b>Two words</b> in numbered list item.
#   a. <b>Two words</b> in lettered list item.
#   [<b>Two words</b>] <b>Two words</b> in labeled list item.
#   ====== <b>Two words</b> in heading
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# <b>Two words</b> in paragraph.
# - <b>Two words</b> in bullet list item.
# 1. <b>Two words</b> in numbered list item.
# a. <b>Two words</b> in lettered list item.
# [<b>Two words</b>] <b>Two words</b> in labeled list item.
# ====== <b>Two words</b> in heading
# ---
#
# ==== Monofont
#
# A single word may be made monofont by prefixed and suffixed plus-signs.
#
# Input:
#
#   +Word+ in paragraph.
#   - +Word+ in bullet list item.
#   1. +Word+ in numbered list item.
#   a. +Word+ in lettered list item.
#   [+word+] +Word+ in labeled list item.
#   ====== +Word+ in heading
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# +Word+ in paragraph.
# - +Word+ in bullet list item.
# 1. +Word+ in numbered list item.
# a. +Word+ in lettered list item.
# [+word+] +Word+ in labeled list item.
# ====== +Word+ in heading
# ---
#
# Any text may be italicized via HTML tag +tt+ or +code+.
#
# Input:
#
#   <tt>Two words</tt> in paragraph.
#   - <tt>Two words</tt> in bullet list item.
#   1. <tt>Two words</tt> in numbered list item.
#   a. <tt>Two words</tt> in lettered list item.
#   [<tt>Two words</tt>] <tt>Two words</tt> in labeled list item.
#   ====== <tt>Two words</tt> in heading
#
# Rendered HTML (everything between the two horizontal rules):
#
# ---
# <tt>Two words</tt> in paragraph.
# - <tt>Two words</tt> in bullet list item.
# 1. <tt>Two words</tt> in numbered list item.
# a. <tt>Two words</tt> in lettered list item.
# [<tt>Two words</tt>] <tt>Two words</tt> in labeled list item.
# ====== <tt>Two words</tt> in heading
# ---
#
# ==== Links
#
# Certain strings in \RDoc text are converted to links.
# Any such linking may be suppressed,
# either by prefixing a backslash or omitting a prefix.
#
# This section shows how to link to (or suppress linking to) various
# targets.
#
# [Class]
#
#   - On-page: <tt>DummyClass</tt> is linked to DummyClass.
#   - Suppressed: <tt>\DummyClass</tt> is not linked to \DummyClass.
#   - Off-page: <tt>RDoc::Markup</tt> is linked to RDoc::Markup.
#   - Suppressed: <tt>\RDoc::Markup</tt> is not linked to \RDoc::Markup.
#
# [Module]
#
#   - On-page: <tt>DummyModule</tt> is linked to DummyModule.
#   - Suppressed: <tt>\DummyModule</tt> is not linked to \DummyModule.
#   - Off-page: <tt>RDoc</tt> is linked to RDoc.
#   - Suppressed: <tt>\RDoc</tt> is not linked to \RDoc.
#
# [Constant]
#
#   - On-page: <tt>DUMMY_CONSTANT</tt> is linked to DUMMY_CONSTANT.
#   - Suppressed: <tt>\DUMMY_CONSTANT</tt> is not linked to \DUMMY_CONSTANT.
#   - Off-page: <tt>RDoc::Text::MARKUP_FORMAT</tt> is linked to RDoc::Text::MARKUP_FORMAT.
#   - Suppressed:  <tt>\RDoc::Text::MARKUP_FORMAT</tt> is not linked
#     to \RDoc::Text::MARKUP_FORMAT.
#
#   [Reviewers note: the off-page link does not work. Should it?]
#
# [Singleton method]
#
#   - On-page: <tt>::dummy_singleton_method</tt> is linked to ::dummy_singleton_method.
#   - Suppressed: <tt>dummy_singleton_method</tt> is not linked to dummy_singleton_method.
#   - Off-page<tt>RDoc::TokenStream::to_html</tt> is linked to RDoc::TokenStream::to_html.
#   - Suppressed: <tt>\RDoc::TokenStream::to_html</tt> is not linked
#     to \RDoc::TokenStream::to_html.
#
#   Note: Occasionally \RDoc does not link to a method whose name
#   has only special characters. Check whether the links you were expecting
#   are actually there.  If not, you'll need to put in a labelled link;
#   see below.
#
#   Pro tip: The link to any method is available in the alphabetical table of contents
#   at the top left of the page for the class or module.
#
# [Instance method]
#
#   - On-page: <tt>#dummy_instance_method</tt> is linked to #dummy_instance_method.
#   - Suppressed: <tt>dummy_instance_method</tt> is not linked to dummy_instance_method.
#   - Off-page: <tt>RDoc::Alias#html_name</tt> is linked to RDoc::Alias#html_name.
#   - Suppressed:  <tt>\RDoc::Alias#html_name</tt> is not linked
#     to \RDoc::Alias#html_name.
#
#     See the Note and Pro Tip immediately above.
#
# [Attribute]
#
#   - On-page: <tt>#dummy_attribute</tt> is linked to #dummy_attribute.
#   - Suppressed: <tt>dummy_attribute</tt> is not linked to dummy_attribute.
#   - Off-page: <tt>RDoc::Alias#name</tt> is linked to RDoc::Alias#name.
#   - Suppressed: <tt>\RDoc::Alias#name</tt> is not linked to \RDoc::Alias#name.
#
# [Alias]
#
#   - On-page: <tt>#dummy_alias</tt> is linked to #dummy_alias.
#   - Suppressed: <tt>dummy_alias</tt> is not linked to dummy_alias.
#   - Off-page: <tt>RDoc::Alias#new_name</tt> is linked to RDoc::Alias#new_name.
#   - Suppressed: <tt>\RDoc::Alias#new_name</tt> is not linked to \RDoc::Alias#new_name.
#
# [Protocol +http+]
#
#   - Linked: <tt>http://yahoo.com</tt> is linked to http://yahoo.com.
#   - Suppressed: <tt>\http://yahoo.com</tt> is not linked to \http://yahoo.com.
#
# [Protocol +https+]
#
#   - Linked: <tt>https://github.com</tt> is linked to https://github.com.
#   - Suppressed: <tt>\https://github.com</tt> is not linked to \https://github.com.
#
# [Protocol +www+]
#
#   - Linked: <tt>www.yahoo.com</tt> is linked to www.yahoo.com.
#   - Suppressed: <tt>\www.yahoo.com</tt> is not linked to \www.yahoo.com.
#
# [Protocol +ftp+]
#
#   - Linked: <tt>ftp://nosuch.site</tt> is linked to ftp://nosuch.site.
#   - Suppressed: <tt>\ftp://nosuch.site</tt> is not linked to \ftp://nosuch.site.
#
# [Protocol +mailto+]
#
#   - Linked:  <tt>mailto:/foo@bar.com</tt> is linked to mailto://foo@bar.com.
#   - Suppressed:  <tt>\mailto:/foo@bar.com</tt> is not linked to \mailto://foo@bar.com.
#
# [Protocol +irc+]
#
#   - link: <tt>irc://irc.freenode.net/ruby</tt> is linked to irc://irc.freenode.net/ruby.
#   - Suppressed: <tt>\irc://irc.freenode.net/ruby</tt> is not linked
#     to \irc://irc.freenode.net/ruby.
#
# [Image file extension]
#
#   - Link: <tt>https://www.ruby-lang.org/images/header-ruby-logo@2x.png</tt> is
#     converted to an in-line HTML +img+ tag, which displays the image in the HTML:
#
#     https://www.ruby-lang.org/images/header-ruby-logo@2x.png
#
#     Also works for +bmp+, +gif+, +jpeg+, and +jpg+ files.
#
#     Note: Works only for a fully qualified URL.
#
#   - Suppressed: <tt>\https://www.ruby-lang.org/images/header-ruby-logo@2x.png</tt>
#     does not link to \https://www.ruby-lang.org/images/header-ruby-logo@2x.png.
#
# [Image link]
#
#   Use the <tt>rdoc-image</tt> scheme to create an image that is also a link:
#
#     {rdoc-image:path/to/image}[link_target]
#
#   - Link: <tt>{rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}[https://www.ruby-lang.org]</tt>
#     displays image <tt>https://www.ruby-lang.org/images/header-ruby-logo@2x.png</tt>
#     as a link to <tt>https://www.ruby-lang.org</tt>.
#
#     {rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}[https://www.ruby-lang.org]
#
#   - Suppressed: <tt>\{rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}[https://www.ruby-lang.org]</tt> creates no link.
#
#     \{rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}[https://www.ruby-lang.org]
#
#   A relative path as the target also works:
#
#   - Link: <tt>{rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}[./Alias.html]</tt> links to <tt>./Alias.html</tt>
#
#     {rdoc-image:https://www.ruby-lang.org/images/header-ruby-logo@2x.png}[./Alias.html]
#
# [Heading]
#
#   - Link: <tt>RDoc::Markup@Links</tt> links to RDoc::Markup@Links.
#
#   - Suppressed: <tt>\RDoc::Markup@Links</tt> does not link to \RDoc::Markup@Links.
#
#   Note that spaces in the actual heading are represented by <tt>+</tt> characters
#   in the linkable text.
#
#   - Link: <tt>RDoc::Markup@Escaping+Text+Markup</tt>
#     links to RDoc::Markup@Escaping+Text+Markup.
#
#   Punctuation and other special characters must be escaped like CGI.escape.
#
#   Pro tip: The link to any heading is available in the alphabetical table of contents
#   at the top left of the page for the class or module.
#
# [Section]
#
#   See {Directives for Categorizing Documentation}[#class-RDOC::MarkupReference-label-Directives+for+Categorizing+Documentation].
#
#   - Link: <tt>RDoc::Markup::ToHtml@Visitor</tt> links to RDoc::Markup::ToHtml@Visitor.
#
#   - Suppressed: <tt>\RDoc::Markup::ToHtml@Visitor</tt> does not link
#     to \RDoc::Markup::ToHtml@Visitor.
#
#   If a section and a heading share the same name, the link target is the section.
#
# [Labeled link]
#
# [Multi-word labeled link]
#
# [Labeled link to label]
#
#   rdoc-label:label_name
#
# [Labeled link with return link]
#
#   rdoc-label:label-other:label-mine
#
# rdoc-ref
#
# link:
#
# === Directives
#
# Certain directives are used in the same way as other \RDoc blocks.
# Each directive described in this section appears on a line by itself.
#
# Directives for allowing or suppressing documentation:
#
# - [<tt>:stopdoc:</tt>]
#   Specifies that \RDoc should ignore markup
#   until next <tt>:startdoc:</tt> directive or end-of-file.
# - [<tt>:startdoc:</tt>]
#   Specifies that \RDoc should resume parsing markup.
# - [<tt>:enddoc:</tt>]
#   Specifies that \RDoc should ignore markup to end-of-file
#   regardless of other directives.
#
# Directive for specifying \RDoc input format:
#
# - [<tt>:markup: _type_</tt>]
#   Specifies the format for the \RDoc input.
#   Parameter +type+ is one of +markdown+, +rd+, +rdoc+, +tomcat+.
#
# Directives for HTML output:
#
# - [<tt>:title: _text_</tt>]
#   Specifies the title for the HTML output.
# - [<tt>:main: _file_name_</tt>]
#   Specifies the HTML file to be displayed first.
#
# Directives for method documentation:
#
# - [<tt>:call-seq:</tt>]
#   For the given method, specifies the calling sequence to be reported in the HTML,
#   overriding the actual calling sequence in the Ruby code.
#   See #call_seq.
# - [<tt>:arg: _arg_name_</tt>]
#   For the given method, specifies the single argument to be reported in the HTML,
#   overriding the actual arguments in the Ruby code.
# - [<tt>:args: _arg_names_</tt>]
# - [<tt>:yield:</tt>]
# - [<tt>:yields: _arg_names_</tt>]
#
# ==== Directives for Categorizing Documentation
#
# Directives for categorizing documentation:
#
# - [<tt>:category: _section_</tt>]
# - [<tt>:section: _title_</tt>]
#
# Directive for including another file:
#
# - [<tt>:include: _filename_</tt>]
#
# == Markup in Code
#
# === Directives in Trailing Comments
#
# Each \RDoc directive in this section appears in a trailing
# comment in a line of code.
#
# - [<tt>:nodoc:</tt>]
#   - Appears in a trailing comment on a line of code
#     that defines a class, module, method, alias, constant, or attribute.
#   - Specifies that the defined object should not be documented.
# - [<tt>:nodoc: all</tt>]
#   - Appears in a trailing comment on a line of code
#     that defines a class or module.
#   - Specifies that the class or module should not be documented.
#     By default, however, a nested class or module _will_ be documented
# - [<tt>:doc:</tt>]
#   - Appears in a trailing comment on a line of code
#     that defines a class, module, method, alias, constant, or attribute.
#   - Specifies the defined object should be documented, even if otherwise
#     would not be documented.
# - [<tt>:notnew:</tt> (aliased as <tt>:not_new</tt> and <tt>:not-new:</tt>)]
#   - Appears in a trailing comment on a line of code
#     that defines instance method +initialize+.
#   - Specifies that singleton method +new+ should not be documented.
#     By default, Ruby fakes a corresponding singleton method +new+,
#     which \RDoc includes in the documentaton.
#     Note that instance method +initialize+ is private, and so by default
#     is not documented.
#
# == Documentation Derived from Ruby Code
#
#
# class, a module, a method, an alias, a constant, or an attribute

class RDOC::MarkupReference

  class DummyClass; end
  module DummyModule; end
  def self.dummy_singleton_method; end
  def dummy_instance_method; end;
  alias dummy_alias dummy_instance_method
  attr_accessor :dummy_attribute
  DUMMY_CONSTANT = ''

  # :call-seq:
  #   Can be anything -> bar
  #   Also anything more -> baz or bat
  #
  # The <tt>:call-seq:</tt> directive overrides the actual calling sequence
  # found in the Ruby code.
  #
  # - It can specify anything at all.
  # - It can have multiple calling sequences.
  #
  # This one includes <tt>Can be anything -> foo</tt>, which is nonsense.
  #
  # Note that the "arrow" is two characters, hyphen and right angle-bracket,
  # which is made into a single character in the HTML.
  #
  # Here is the actual code for this method:
  #
  #   def call_seq(foo)
  #     nil
  #   end
  #
  # And here is the <tt>:call-seq:</t> directive given for the method:
  #
  #   :call-seq:
  #     Can be anything -> bar
  #     Also anything more -> baz or bat
  #
  def call_seq(foo)
    nil
  end

  # :arg: baz
  #
  # The <tt>:arg:</tt> directive overrides the actual arguments found in the Ruby code.
  #
  # Here is the actual code for this method:
  #
  #   def arg(foo, bar)
  #     nil
  #   end
  #
  # And here is the <tt>:arg:</tt> directive given for the method:
  #
  #   :arg: baz
  #
  def arg(foo, bar)
    nil
  end

end