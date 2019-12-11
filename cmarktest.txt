### Failure in: 0:"Example No:1"            
CMarkTests.hs:59
expected: "<pre><code>foo\tbaz\t\tbim\n</code></pre>\n"
 but got: "<p>\tfoo\tbaz\t\tbim</p>\n"
### Failure in: 1:"Example No:2"   
CMarkTests.hs:59
expected: "<pre><code>foo\tbaz\t\tbim\n</code></pre>\n"
 but got: "<p>  \tfoo\tbaz\t\tbim</p>\n"
### Failure in: 2:"Example No:3"            
CMarkTests.hs:59
expected: "<pre><code class>a\ta\n\8016\ta\n</code></pre>\n" -- ##############################################################################
 but got: "<pre><code>a\ta\n\8016\ta\n</code></pre>\n"
### Failure in: 3:"Example No:4"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n" -- ##############################################################################
 but got: "<ul><li>foo\n</li></ul>\n<p>\tbar</p>\n"
### Failure in: 4:"Example No:5"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<pre><code>  bar\n</code></pre>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\n</li></ul>\n<p>\t\tbar</p>\n"
### Failure in: 5:"Example No:6"            
CMarkTests.hs:59
expected: "<blockquote>\n<pre><code>  foo\n</code></pre>\n</blockquote>\n"
 but got: "<p>&gt;\t\tfoo</p>\n"
### Failure in: 6:"Example No:7"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<pre><code>  foo\n</code></pre>\n</li>\n</ul>\n"
 but got: "<p>-\t\tfoo</p>\n"
### Failure in: 7:"Example No:8"            
CMarkTests.hs:59
expected: "<pre><code>foo\nbar\n</code></pre>\n"
 but got: "<pre><code>foo\n</code></pre>\n<p>\tbar</p>\n"
### Failure in: 8:"Example No:9"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>baz</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\n<ul><li>bar\n\t - baz\n</li></ul>\n</li></ul>\n"
### Failure in: 9:"Example No:10"           
CMarkTests.hs:59
expected: "<h1>Foo</h1>\n"
 but got: "<p>#\tFoo</p>\n"
### Failure in: 10:"Example No:11"            
CMarkTests.hs:59
expected: "<hr />\n"
 but got: "<p><em>\t</em>\t*\t</p>\n"
### Failure in: 11:"Example No:12"            
CMarkTests.hs:59
expected: "<p>!&quot;#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~</p>\n"
 but got: "<p>!&quot;#$%&amp;&#39;()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~</p>\n"
### Failure in: 12:"Example No:13"            
CMarkTests.hs:59
expected: "<p>\\\t\\A\\a\\ \\3\\\966\\\171</p>\n"
 but got: "<p>\tAa 3\966\171</p>\n"
### Failure in: 15:"Example No:16"            
CMarkTests.hs:59
expected: "<p>foo<br />\nbar</p>\n"
 but got: ""
### Failure in: 16:"Example No:17"            
CMarkTests.hs:59
expected: "<p><code>\\[\\`</code></p>\n"
 but got: "<p><code></code> [` <code></code></p>\n"
### Failure in: 18:"Example No:19"            
CMarkTests.hs:59
expected: "<pre><code>\\[\\]\n</code></pre>\n"
 but got: "<hr />\n<p>[]</p>\n<hr />\n"
### Failure in: 19:"Example No:20"            
CMarkTests.hs:59
expected: "<p><a href=\"http://example.com?find=%5C*\">http://example.com?find=\\*</a></p>\n"
 but got: "<p>&lt;http://example.com?find=*&gt;</p>\n"
### Failure in: 20:"Example No:21"            
CMarkTests.hs:59
expected: "<a href=\"/bar\\/)\">\n"
 but got: "<p>&lt;a href=&quot;/bar/)&quot;&gt;</p>\n"
### Failure in: 21:"Example No:22"            
CMarkTests.hs:59
expected: "<p><a href=\"/bar*\" title=\"ti*tle\">foo</a></p>\n"
 but got: "<p><a href=\"/bar\\*\" title=\"ti\\*tle\">foo</a></p>\n"
### Failure in: 22:"Example No:23"            
CMarkTests.hs:59
expected: "<p><a href=\"/bar*\" title=\"ti*tle\">foo</a></p>\n"
 but got: "<p>[foo]</p>\n<p>[foo]: /bar* &quot;ti*tle&quot;</p>\n"
### Failure in: 23:"Example No:24"            
CMarkTests.hs:59
expected: "<pre><code class=\"language-foo+bar\">foo\n</code></pre>\n"
 but got: "<p><code> foo\\+bar foo </code></p>\n"
### Failure in: 24:"Example No:25"            
CMarkTests.hs:59
expected: "<p>\160 &amp; \169 \198 \270\n\190 \8459 \8518\n\8754 \8807\824</p>\n"
 but got: "<p>&amp;nbsp; &amp;amp; &amp;copy; &amp;AElig; &amp;Dcaron;\n&amp;frac34; &amp;HilbertSpace; &amp;DifferentialD;\n&amp;ClockwiseContourIntegral; &amp;ngE;</p>\n"
### Failure in: 25:"Example No:26"            
CMarkTests.hs:59
expected: "<p># \1234 \992 \65533</p>\n"
 but got: "<p>&amp;#35; &amp;#1234; &amp;#992; &amp;#0;</p>\n"
### Failure in: 26:"Example No:27"            
CMarkTests.hs:59
expected: "<p>&quot; \3334 \3243</p>\n"
 but got: "<p>&amp;#X22; &amp;#XD06; &amp;#xcab;</p>\n"
### Failure in: 30:"Example No:31"            
CMarkTests.hs:59
expected: "<a href=\"&ouml;&ouml;.html\">\n"
 but got: "<p>&lt;a href=&quot;&amp;ouml;&amp;ouml;.html&quot;&gt;</p>\n"
### Failure in: 31:"Example No:32"            
CMarkTests.hs:59
expected: "<p><a href=\"/f%C3%B6%C3%B6\" title=\"f\246\246\">foo</a></p>\n"
 but got: "<p><a href=\"/f&amp;ouml;&amp;ouml;\" title=\"f&amp;ouml;&amp;ouml;\">foo</a></p>\n"
### Failure in: 32:"Example No:33"            
CMarkTests.hs:59
expected: "<p><a href=\"/f%C3%B6%C3%B6\" title=\"f\246\246\">foo</a></p>\n"
 but got: "<p>[foo]</p>\n<p>[foo]: /f&amp;ouml;&amp;ouml; &quot;f&amp;ouml;&amp;ouml;&quot;</p>\n"
### Failure in: 33:"Example No:34"            
CMarkTests.hs:59
expected: "<pre><code class=\"language-f\246\246\">foo\n</code></pre>\n"
 but got: "<p><code> f&amp;ouml;&amp;ouml; foo </code></p>\n"
### Failure in: 36:"Example No:37"            
CMarkTests.hs:59
expected: "<p>*foo*\n<em>foo</em></p>\n"
 but got: "<p>&amp;#42;foo&amp;#42;<em>foo</em></p>\n"
### Failure in: 37:"Example No:38"            
CMarkTests.hs:59
expected: "<p>* foo</p>\n<ul>\n<li>foo</li>\n</ul>\n"
 but got: "<p>&amp;#42; foo</p>\n<ul><li>foo\n</li></ul>\n"
### Failure in: 38:"Example No:39"            
CMarkTests.hs:59
expected: "<p>foo\n\nbar</p>\n"
 but got: "<p>foo&amp;#10;&amp;#10;bar</p>\n"
### Failure in: 39:"Example No:40"            
CMarkTests.hs:59
expected: "<p>\tfoo</p>\n"
 but got: "<p>&amp;#9;foo</p>\n"
### Failure in: 40:"Example No:41"            
CMarkTests.hs:59
expected: "<p>[a](url &quot;tit&quot;)</p>\n"
 but got: "<p>[a](url &amp;quot;tit&amp;quot;)</p>\n"
### Failure in: 41:"Example No:42"            
CMarkTests.hs:59
expected: "<ul>\n<li>`one</li>\n<li>two`</li>\n</ul>\n"
 but got: "<ul><li><code>one - two</code>\n</li></ul>\n"
### Failure in: 42:"Example No:43"            
CMarkTests.hs:59
expected: "<hr />\n<hr />\n<hr />\n"
 but got: "<hr />\n<hr />\n<p><em>_</em></p>\n"
### Failure in: 48:"Example No:49"            
CMarkTests.hs:59
expected: "<p>Foo\n***</p>\n"
 but got: "<p>Foo</p>\n<pre><code>***\n</code></pre>\n"
### Failure in: 49:"Example No:50"            
CMarkTests.hs:59
expected: "<hr />\n"
 but got: "<p><strong><strong><em>_</em><strong><strong><strong>_</strong></strong></strong></strong></strong><em>_</em>__</p>\n"
### Failure in: 54:"Example No:55"            
CMarkTests.hs:59
expected: "<p>_ _ _ _ a</p>\n<p>a------</p>\n<p>---a---</p>\n"
 but got: "<p><em> </em> <em> </em> a</p>\n<p>a------</p>\n<p>---a---</p>\n"
### Failure in: 55:"Example No:56"            
CMarkTests.hs:59
expected: "<p><em>-</em></p>\n"
 but got: "<p> <em>-</em></p>\n"
### Failure in: 56:"Example No:57"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n</ul>\n<hr />\n<ul>\n<li>bar</li>\n</ul>\n"
 but got: "<ul><li>foo\n</li></ul>\n<hr />\n<ul><li>bar\n</li></ul>\n"
### Failure in: 58:"Example No:59"            
CMarkTests.hs:59
expected: "<h2>Foo</h2>\n<p>bar</p>\n"
 but got: "<p>Foo</p>\n<hr />\n<p>bar</p>\n"
### Failure in: 59:"Example No:60"            
CMarkTests.hs:59
expected: "<ul>\n<li>Foo</li>\n</ul>\n<hr />\n<ul>\n<li>Bar</li>\n</ul>\n"
 but got: "<ul><li>Foo\n</li><li><ul><li><em>\n</em> Bar\n</li></ul>\n</li></ul>\n"
### Failure in: 60:"Example No:61"            
CMarkTests.hs:59
expected: "<ul>\n<li>Foo</li>\n<li>\n<hr />\n</li>\n</ul>\n"
 but got: "<ul><li>Foo\n</li><li><hr />\n</li></ul>\n"
### Failure in: 69:"Example No:70"            
CMarkTests.hs:59
expected: "<p>foo\n# bar</p>\n"
 but got: "<p>foo</p>\n<pre><code># bar\n</code></pre>\n"
### Failure in: 74:"Example No:75"            
CMarkTests.hs:59
expected: "<h1>foo#</h1>\n"
 but got: "<h1>foo</h1>\n"
### Failure in: 75:"Example No:76"            
CMarkTests.hs:59
expected: "<h3>foo ###</h3>\n<h2>foo ###</h2>\n<h1>foo #</h1>\n"
 but got: "<h3>foo</h3>\n<h2>foo</h2>\n<h1>foo</h1>\n"
### Failure in: 78:"Example No:79"            
CMarkTests.hs:59
expected: "<h2></h2>\n<h1></h1>\n<h3></h3>\n"
 but got: "<h2>\n</h2>\n<h3></h3>\n"
### Failure in: 79:"Example No:80"            
CMarkTests.hs:59
expected: "<h1>Foo <em>bar</em></h1>\n<h2>Foo <em>bar</em></h2>\n"
 but got: "<p>Foo <em>bar</em>\n=========</p>\n<p>Foo <em>bar</em></p>\n<hr />\n"
### Failure in: 80:"Example No:81"            
CMarkTests.hs:59
expected: "<h1>Foo <em>bar\nbaz</em></h1>\n"
 but got: "<p>Foo <em>bar\nbaz</em>\n====</p>\n"
### Failure in: 81:"Example No:82"            
CMarkTests.hs:59
expected: "<h1>Foo <em>bar\nbaz</em></h1>\n"
 but got: "<p>  Foo <em>bar\nbaz</em>\t\n====</p>\n"
### Failure in: 82:"Example No:83"            
CMarkTests.hs:59
expected: "<h2>Foo</h2>\n<h1>Foo</h1>\n"
 but got: "<p>Foo</p>\n<hr />\n<p>Foo\n=</p>\n"
### Failure in: 83:"Example No:84"            
CMarkTests.hs:59
expected: "<h2>Foo</h2>\n<h2>Foo</h2>\n<h1>Foo</h1>\n"
 but got: "<p>   Foo</p>\n<hr />\n<p>  Foo</p>\n<hr />\n<p>  Foo\n===</p>\n"
### Failure in: 85:"Example No:86"            
CMarkTests.hs:59
expected: "<h2>Foo</h2>\n"
 but got: "<p>Foo</p>\n<hr />\n"
### Failure in: 86:"Example No:87"            
CMarkTests.hs:59
expected: "<p>Foo\n---</p>\n"
 but got: "<p>Foo</p>\n<pre><code>---\n</code></pre>\n"
### Failure in: 88:"Example No:89"            
CMarkTests.hs:59
expected: "<h2>Foo</h2>\n"
 but got: "<p>Foo<br /></p>\n<hr />\n"
### Failure in: 89:"Example No:90"            
CMarkTests.hs:59
expected: "<h2>Foo\\</h2>\n"
 but got: ""
### Failure in: 90:"Example No:91"            
CMarkTests.hs:59
expected: "<h2>`Foo</h2>\n<p>`</p>\n<h2>&lt;a title=&quot;a lot</h2>\n<p>of dashes&quot;/&gt;</p>\n"
 but got: "<p><code>Foo ---- </code></p>\n<p>&lt;a title=&quot;a lot</p>\n<hr />\n<p>of dashes&quot;/&gt;</p>\n"
### Failure in: 91:"Example No:92"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>Foo</p>\n</blockquote>\n<hr />\n"
 but got: "<p>&gt; Foo</p>\n<hr />\n"
### Failure in: 92:"Example No:93"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo\nbar\n===</p>\n</blockquote>\n"
 but got: "<p>&gt; foo\nbar\n===</p>\n"
### Failure in: 93:"Example No:94"            
CMarkTests.hs:59
expected: "<ul>\n<li>Foo</li>\n</ul>\n<hr />\n"
 but got: "<ul><li>Foo\n</li></ul>\n<hr />\n"
### Failure in: 94:"Example No:95"            
CMarkTests.hs:59
expected: "<h2>Foo\nBar</h2>\n"
 but got: "<p>Foo\nBar</p>\n<hr />\n"
### Failure in: 95:"Example No:96"            
CMarkTests.hs:59
expected: "<hr />\n<h2>Foo</h2>\n<h2>Bar</h2>\n<p>Baz</p>\n"
 but got: "<hr />\n<p>Foo</p>\n<hr />\n<p>Bar</p>\n<hr />\n<p>Baz</p>\n"
### Failure in: 96:"Example No:97"            
CMarkTests.hs:59
expected: "<p>====</p>\n"
 but got: "<p>\n====</p>\n"
### Failure in: 98:"Example No:99"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n</ul>\n<hr />\n"
 but got: "<ul><li>foo\n</li></ul>\n<hr />\n"
### Failure in: 100:"Example No:101"           
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo</p>\n</blockquote>\n<hr />\n"
 but got: "<p>&gt; foo</p>\n<hr />\n"
### Failure in: 101:"Example No:102"           
CMarkTests.hs:59
expected: "<h2>&gt; foo</h2>\n"
 but got: "<p>&gt; foo</p>\n<hr />\n"
### Failure in: 102:"Example No:103"           
CMarkTests.hs:59
expected: "<p>Foo</p>\n<h2>bar</h2>\n<p>baz</p>\n"
 but got: "<p>Foo</p>\n<p>bar</p>\n<hr />\n<p>baz</p>\n"
### Failure in: 107:"Example No:108"           
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\nbar\n</li></ul>\n"
### Failure in: 108:"Example No:109"           
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>foo</p>\n<ul>\n<li>bar</li>\n</ul>\n</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li>foo\n<ul><li>bar\n</li></ul>\n</li></ol>\n"
### Failure in: 114:"Example No:115"           
CMarkTests.hs:59
expected: "<h1>Heading</h1>\n<pre><code>foo\n</code></pre>\n<h2>Heading</h2>\n<pre><code>foo\n</code></pre>\n<hr />\n"
 but got: "<h1>Heading</h1>\n<pre><code>foo\n</code></pre>\n<p>Heading</p>\n<hr />\n<pre><code>foo\n</code></pre>\n<hr />\n"
### Failure in: 116:"Example No:117"           
CMarkTests.hs:59
expected: "<pre><code>foo\n</code></pre>\n"
 but got: ""
### Failure in: 118:"Example No:119"           
CMarkTests.hs:59
expected: "<pre><code>&lt;\n &gt;\n</code></pre>\n"
 but got: "<pre><code>&lt;\n &gt;</code></pre>\n"
### Failure in: 119:"Example No:120"           
CMarkTests.hs:59
expected: "<pre><code>&lt;\n &gt;\n</code></pre>\n"
 but got: "<hr />\n<p>&lt;\n&gt;</p>\n<hr />\n"
### Failure in: 120:"Example No:121"           
CMarkTests.hs:59
expected: "<p><code>foo</code></p>\n"
 but got: "<p><code> foo </code></p>\n"
### Failure in: 121:"Example No:122"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n~~~\n</code></pre>\n"
 but got: "<pre><code>aaa\n~~~</code></pre>\n"
### Failure in: 122:"Example No:123"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n```\n</code></pre>\n"
 but got: "<hr />\n<p>aaa<code></code>`</p>\n<hr />\n"
### Failure in: 123:"Example No:124"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n```\n</code></pre>\n"
 but got: "<p><code></code>\naaa</p>\n<pre><code></code></pre>\n"
### Failure in: 124:"Example No:125"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n~~~\n</code></pre>\n"
 but got: "<hr />\n<p>aaa</p>\n<hr />\n<hr />\n"
### Failure in: 125:"Example No:126"           
CMarkTests.hs:59
expected: "<pre><code></code></pre>\n"
 but got: "<p><code></code>`</p>\n"
### Failure in: 126:"Example No:127"           
CMarkTests.hs:59
expected: "<pre><code>\n```\naaa\n</code></pre>\n"
 but got: "<p><code></code>`</p>\n<p><code></code>`\naaa</p>\n"
### Failure in: 127:"Example No:128"           
CMarkTests.hs:59
expected: "<blockquote>\n<pre><code>aaa\n</code></pre>\n</blockquote>\n<p>bbb</p>\n"
 but got: "<p>&gt; <code></code>`\n&gt; aaa</p>\n<p>bbb</p>\n"
### Failure in: 128:"Example No:129"           
CMarkTests.hs:59
expected: "<pre><code>\n  \n</code></pre>\n"
 but got: "<pre><code>\n  </code></pre>\n"
### Failure in: 130:"Example No:131"           
CMarkTests.hs:59
expected: "<pre><code>aaa\naaa\n</code></pre>\n"
 but got: "<pre><code> aaa\naaa</code></pre>\n"
### Failure in: 131:"Example No:132"           
CMarkTests.hs:59
expected: "<pre><code>aaa\naaa\naaa\n</code></pre>\n"
 but got: "<pre><code>aaa\n  aaa\naaa</code></pre>\n"
### Failure in: 132:"Example No:133"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n aaa\naaa\n</code></pre>\n"
 but got: "<pre><code>   aaa\n    aaa\n  aaa</code></pre>\n"
### Failure in: 134:"Example No:135"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n</code></pre>\n"
 but got: "<pre><code>aaa</code></pre>\n"
### Failure in: 135:"Example No:136"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n</code></pre>\n"
 but got: "<pre><code>aaa</code></pre>\n"
### Failure in: 136:"Example No:137"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n    ```\n</code></pre>\n"
 but got: "<pre><code>aaa</code></pre>\n"
### Failure in: 138:"Example No:139"           
CMarkTests.hs:59
expected: "<pre><code>aaa\n~~~ ~~\n</code></pre>\n"
 but got: "<hr />\n<p>aaa</p>\n<hr />\n"
### Failure in: 139:"Example No:140"           
CMarkTests.hs:59
expected: "<p>foo</p>\n<pre><code>bar\n</code></pre>\n<p>baz</p>\n"
 but got: "<p>foo</p>\n<pre><code>bar</code></pre>\n<p>baz</p>\n"
### Failure in: 140:"Example No:141"           
CMarkTests.hs:59
expected: "<h2>foo</h2>\n<pre><code>bar\n</code></pre>\n<h1>baz</h1>\n"
 but got: "<p>foo</p>\n<hr />\n<hr />\n<p>bar</p>\n<hr />\n<h1>baz</h1>\n"
### Failure in: 141:"Example No:142"           
CMarkTests.hs:59
expected: "<pre><code class=\"language-ruby\">def foo(x)\n  return 3\nend\n</code></pre>\n"
 but got: "<pre><code class=\"language-ruby\">def foo(x)\n  return 3\nend</code></pre>\n"
### Failure in: 142:"Example No:143"           
CMarkTests.hs:59
expected: "<pre><code class=\"language-ruby\">def foo(x)\n  return 3\nend\n</code></pre>\n"
 but got: "<p>~~~~    ruby startline=3 $%@#$\ndef foo(x)\nreturn 3\nend</p>\n<hr />\n"
### Failure in: 143:"Example No:144"           
CMarkTests.hs:59
expected: "<pre><code class=\"language-;\"></code></pre>\n"
 but got: "<p><code></code>;<code></code></p>\n"
### Failure in: 144:"Example No:145"           
CMarkTests.hs:59
expected: "<p><code>aa</code>\nfoo</p>\n"
 but got: "<p><code> aa </code>\nfoo</p>\n"
### Failure in: 145:"Example No:146"           
CMarkTests.hs:59
expected: "<pre><code class=\"language-aa\">foo\n</code></pre>\n"
 but got: "<p>~~~ aa <code></code>` ~~~\nfoo</p>\n<hr />\n"
### Failure in: 146:"Example No:147"           
CMarkTests.hs:59
expected: "<pre><code>``` aaa\n</code></pre>\n"
 but got: "<pre><code></code></pre>\n<p> aaa<code></code>`</p>\n"
### Failure in: 147:"Example No:148"           
CMarkTests.hs:59
expected: "<table><tr><td>\n<pre>\n**Hello**,\n<p><em>world</em>.\n</pre></p>\n</td></tr></table>\n"
 but got: "<p>&lt;table&gt;&lt;tr&gt;&lt;td&gt;\n&lt;pre&gt;<strong>Hello</strong>,</p>\n<p><em>world</em>.\n&lt;/pre&gt;\n&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;</p>\n"
### Failure in: 148:"Example No:149"           
CMarkTests.hs:59
expected: "<table>\n  <tr>\n    <td>\n           hi\n    </td>\n  </tr>\n</table>\n<p>okay.</p>\n"
 but got: "<p>&lt;table&gt;\n&lt;tr&gt;\n&lt;td&gt;\nhi\n&lt;/td&gt;\n&lt;/tr&gt;\n&lt;/table&gt;</p>\n<p>okay.</p>\n"
### Failure in: 149:"Example No:150"           
CMarkTests.hs:59
expected: " <div>\n  *hello*\n         <foo><a>\n"
 but got: "<p> &lt;div&gt;<em>hello</em>\n&lt;foo&gt;&lt;a&gt;</p>\n"
### Failure in: 150:"Example No:151"            
CMarkTests.hs:59
expected: "</div>\n*foo*\n"
 but got: "<p>&lt;/div&gt;<em>foo</em></p>\n"
### Failure in: 151:"Example No:152"            
CMarkTests.hs:59
expected: "<DIV CLASS=\"foo\">\n<p><em>Markdown</em></p>\n</DIV>\n"
 but got: "<p>&lt;DIV CLASS=&quot;foo&quot;&gt;</p>\n<p><em>Markdown</em></p>\n<p>&lt;/DIV&gt;</p>\n"
### Failure in: 152:"Example No:153"            
CMarkTests.hs:59
expected: "<div id=\"foo\"\n  class=\"bar\">\n</div>\n"
 but got: "<p>&lt;div id=&quot;foo&quot;\nclass=&quot;bar&quot;&gt;\n&lt;/div&gt;</p>\n"
### Failure in: 153:"Example No:154"            
CMarkTests.hs:59
expected: "<div id=\"foo\" class=\"bar\n  baz\">\n</div>\n"
 but got: "<p>&lt;div id=&quot;foo&quot; class=&quot;bar\nbaz&quot;&gt;\n&lt;/div&gt;</p>\n"
### Failure in: 154:"Example No:155"            
CMarkTests.hs:59
expected: "<div>\n*foo*\n<p><em>bar</em></p>\n"
 but got: "<p>&lt;div&gt;<em>foo</em></p>\n<p><em>bar</em></p>\n"
### Failure in: 155:"Example No:156"            
CMarkTests.hs:59
expected: "<div id=\"foo\"\n*hi*\n"
 but got: "<p>&lt;div id=&quot;foo&quot;<em>hi</em></p>\n"
### Failure in: 156:"Example No:157"            
CMarkTests.hs:59
expected: "<div class\nfoo\n"
 but got: "<p>&lt;div class\nfoo</p>\n"
### Failure in: 157:"Example No:158"            
CMarkTests.hs:59
expected: "<div *???-&&&-<---\n*foo*\n"
 but got: "<p>&lt;div <em>???-&amp;&amp;&amp;-&lt;---</em>foo*</p>\n"
### Failure in: 158:"Example No:159"            
CMarkTests.hs:59
expected: "<div><a href=\"bar\">*foo*</a></div>\n"
 but got: "<p>&lt;div&gt;&lt;a href=&quot;bar&quot;&gt;<em>foo</em>&lt;/a&gt;&lt;/div&gt;</p>\n"
### Failure in: 159:"Example No:160"            
CMarkTests.hs:59
expected: "<table><tr><td>\nfoo\n</td></tr></table>\n"
 but got: "<p>&lt;table&gt;&lt;tr&gt;&lt;td&gt;\nfoo\n&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;</p>\n"
### Failure in: 160:"Example No:161"            
CMarkTests.hs:59
expected: "<div></div>\n``` c\nint x = 33;\n```\n"
 but got: "<p>&lt;div&gt;&lt;/div&gt;</p>\n<pre><code class=\"language-c\">int x = 33;</code></pre>\n"
### Failure in: 161:"Example No:162"            
CMarkTests.hs:59
expected: "<a href=\"foo\">\n*bar*\n</a>\n"
 but got: "<p>&lt;a href=&quot;foo&quot;&gt;<em>bar</em>\n&lt;/a&gt;</p>\n"
### Failure in: 162:"Example No:163"            
CMarkTests.hs:59
expected: "<Warning>\n*bar*\n</Warning>\n"
 but got: "<p>&lt;Warning&gt;<em>bar</em>\n&lt;/Warning&gt;</p>\n"
### Failure in: 163:"Example No:164"            
CMarkTests.hs:59
expected: "<i class=\"foo\">\n*bar*\n</i>\n"
 but got: "<p>&lt;i class=&quot;foo&quot;&gt;<em>bar</em>\n&lt;/i&gt;</p>\n"
### Failure in: 164:"Example No:165"            
CMarkTests.hs:59
expected: "</ins>\n*bar*\n"
 but got: "<p>&lt;/ins&gt;<em>bar</em></p>\n"
### Failure in: 165:"Example No:166"            
CMarkTests.hs:59
expected: "<del>\n*foo*\n</del>\n"
 but got: "<p>&lt;del&gt;<em>foo</em>\n&lt;/del&gt;</p>\n"
### Failure in: 166:"Example No:167"            
CMarkTests.hs:59
expected: "<del>\n<p><em>foo</em></p>\n</del>\n"
 but got: "<p>&lt;del&gt;</p>\n<p><em>foo</em></p>\n<p>&lt;/del&gt;</p>\n"
### Failure in: 167:"Example No:168"            
CMarkTests.hs:59
expected: "<p><del><em>foo</em></del></p>\n"
 but got: "<p>&lt;del&gt;<em>foo</em>&lt;/del&gt;</p>\n"
### Failure in: 168:"Example No:169"            
CMarkTests.hs:59
expected: "<pre language=\"haskell\"><code>\nimport Text.HTML.TagSoup\n\nmain :: IO ()\nmain = print $ parseTags tags\n</code></pre>\n<p>okay</p>\n"
 but got: "<p>&lt;pre language=&quot;haskell&quot;&gt;&lt;code&gt;\nimport Text.HTML.TagSoup</p>\n<p>main :: IO ()\nmain = print $ parseTags tags\n&lt;/code&gt;&lt;/pre&gt;\nokay</p>\n"
### Failure in: 169:"Example No:170"            
CMarkTests.hs:59
expected: "<script type=\"text/javascript\">\n// JavaScript example\n\ndocument.getElementById(\"demo\").innerHTML = \"Hello JavaScript!\";\n</script>\n<p>okay</p>\n"
 but got: "<p>&lt;script type=&quot;text/javascript&quot;&gt;\n// JavaScript example</p>\n<p>document.getElementById(&quot;demo&quot;).innerHTML = &quot;Hello JavaScript!&quot;;\n&lt;/script&gt;\nokay</p>\n"
### Failure in: 170:"Example No:171"            
CMarkTests.hs:59
expected: "<style\n  type=\"text/css\">\nh1 {color:red;}\n\np {color:blue;}\n</style>\n<p>okay</p>\n"
 but got: "<p>&lt;style\ntype=&quot;text/css&quot;&gt;\nh1 {color:red;}</p>\n<p>p {color:blue;}\n&lt;/style&gt;\nokay</p>\n"
### Failure in: 171:"Example No:172"            
CMarkTests.hs:59
expected: "<style\n  type=\"text/css\">\n\nfoo\n"
 but got: "<p>&lt;style\ntype=&quot;text/css&quot;&gt;</p>\n<p>foo</p>\n"
### Failure in: 172:"Example No:173"            
CMarkTests.hs:59
expected: "<blockquote>\n<div>\nfoo\n</blockquote>\n<p>bar</p>\n"
 but got: "<p>&gt; &lt;div&gt;\n&gt; foo</p>\n<p>bar</p>\n"
### Failure in: 173:"Example No:174"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<div>\n</li>\n<li>foo</li>\n</ul>\n"
 but got: "<ul><li>&lt;div&gt;\n</li><li>foo\n</li></ul>\n"
### Failure in: 174:"Example No:175"            
CMarkTests.hs:59
expected: "<style>p{color:red;}</style>\n<p><em>foo</em></p>\n"
 but got: "<p>&lt;style&gt;p{color:red;}&lt;/style&gt;<em>foo</em></p>\n"
### Failure in: 175:"Example No:176"            
CMarkTests.hs:59
expected: "<!-- foo -->*bar*\n<p><em>baz</em></p>\n"
 but got: "<p>&lt;!-- foo --&gt;<em>bar</em>\n<em>baz</em></p>\n"
### Failure in: 176:"Example No:177"            
CMarkTests.hs:59
expected: "<script>\nfoo\n</script>1. *bar*\n"
 but got: "<p>&lt;script&gt;\nfoo\n&lt;/script&gt;1. <em>bar</em></p>\n"
### Failure in: 177:"Example No:178"            
CMarkTests.hs:59
expected: "<!-- Foo\n\nbar\n   baz -->\n<p>okay</p>\n"
 but got: "<p>&lt;!-- Foo</p>\n<p>bar\nbaz --&gt;\nokay</p>\n"
### Failure in: 178:"Example No:179"            
CMarkTests.hs:59
expected: "<?php\n\n  echo '>';\n\n?>\n<p>okay</p>\n"
 but got: "<p>&lt;?php</p>\n<p>  echo &#39;&gt;&#39;;</p>\n<p>?&gt;\nokay</p>\n"
### Failure in: 179:"Example No:180"            
CMarkTests.hs:59
expected: "<!DOCTYPE html>\n"
 but got: "<p>&lt;!DOCTYPE html&gt;</p>\n"
### Failure in: 180:"Example No:181"            
CMarkTests.hs:59
expected: "<![CDATA[\nfunction matchwo(a,b)\n{\n  if (a < b && a < 0) then {\n    return 1;\n\n  } else {\n\n    return 0;\n  }\n}\n]]>\n<p>okay</p>\n"
 but got: "<p>&lt;![CDATA[\nfunction matchwo(a,b)\n{\nif (a &lt; b &amp;&amp; a &lt; 0) then {\nreturn 1;</p>\n<p>  } else {</p>\n<pre><code>return 0;\n</code></pre>\n<p>}\n}\n]]&gt;\nokay</p>\n"
### Failure in: 181:"Example No:182"            
CMarkTests.hs:59
expected: "  <!-- foo -->\n<pre><code>&lt;!-- foo --&gt;\n</code></pre>\n"
 but got: "<p>  &lt;!-- foo --&gt;</p>\n<pre><code>&lt;!-- foo --&gt;\n</code></pre>\n"
### Failure in: 182:"Example No:183"            
CMarkTests.hs:59
expected: "  <div>\n<pre><code>&lt;div&gt;\n</code></pre>\n"
 but got: "<p>  &lt;div&gt;</p>\n<pre><code>&lt;div&gt;\n</code></pre>\n"
### Failure in: 183:"Example No:184"            
CMarkTests.hs:59
expected: "<p>Foo</p>\n<div>\nbar\n</div>\n"
 but got: "<p>Foo\n&lt;div&gt;\nbar\n&lt;/div&gt;</p>\n"
### Failure in: 184:"Example No:185"            
CMarkTests.hs:59
expected: "<div>\nbar\n</div>\n*foo*\n"
 but got: "<p>&lt;div&gt;\nbar\n&lt;/div&gt;<em>foo</em></p>\n"
### Failure in: 185:"Example No:186"            
CMarkTests.hs:59
expected: "<p>Foo\n<a href=\"bar\">\nbaz</p>\n"
 but got: "<p>Foo\n&lt;a href=&quot;bar&quot;&gt;\nbaz</p>\n"
### Failure in: 186:"Example No:187"            
CMarkTests.hs:59
expected: "<div>\n<p><em>Emphasized</em> text.</p>\n</div>\n"
 but got: "<p>&lt;div&gt;</p>\n<p><em>Emphasized</em> text.</p>\n<p>&lt;/div&gt;</p>\n"
### Failure in: 187:"Example No:188"            
CMarkTests.hs:59
expected: "<div>\n*Emphasized* text.\n</div>\n"
 but got: "<p>&lt;div&gt;<em>Emphasized</em> text.\n&lt;/div&gt;</p>\n"
### Failure in: 188:"Example No:189"            
CMarkTests.hs:59
expected: "<table>\n<tr>\n<td>\nHi\n</td>\n</tr>\n</table>\n"
 but got: "<p>&lt;table&gt;</p>\n<p>&lt;tr&gt;</p>\n<p>&lt;td&gt;\nHi\n&lt;/td&gt;</p>\n<p>&lt;/tr&gt;</p>\n<p>&lt;/table&gt;</p>\n"
### Failure in: 189:"Example No:190"            
CMarkTests.hs:59
expected: "<table>\n  <tr>\n<pre><code>&lt;td&gt;\n  Hi\n&lt;/td&gt;\n</code></pre>\n  </tr>\n</table>\n"
 but got: "<p>&lt;table&gt;</p>\n<p>  &lt;tr&gt;</p>\n<pre><code>&lt;td&gt;\n  Hi\n&lt;/td&gt;\n\n</code></pre>\n<p>&lt;/tr&gt;</p>\n<p>&lt;/table&gt;</p>\n"
### Failure in: 190:"Example No:191"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
 but got: "<p>[foo]: /url &quot;title&quot;</p>\n<p>[foo]</p>\n"
### Failure in: 191:"Example No:192"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"the title\">foo</a></p>\n"
 but got: "<p>   [foo]:\n/url<br />\n&#39;the title&#39;</p>\n<p>[foo]</p>\n"
### Failure in: 192:"Example No:193"            
CMarkTests.hs:59
expected: "<p><a href=\"my_(url)\" title=\"title (with parens)\">Foo*bar]</a></p>\n"
 but got: "<p>[Foo*bar]]:my_(url) &#39;title (with parens)&#39;</p>\n<p>[Foo*bar]]</p>\n"
### Failure in: 193:"Example No:194"            
CMarkTests.hs:59
expected: "<p><a href=\"my%20url\" title=\"title\">Foo bar</a></p>\n"
 but got: "<p>[Foo bar]:\n&lt;my url&gt;\n&#39;title&#39;</p>\n<p>[Foo bar]</p>\n"
### Failure in: 194:"Example No:195"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"\ntitle\nline1\nline2\n\">foo</a></p>\n"
 but got: "<p>[foo]: /url &#39;\ntitle\nline1\nline2\n&#39;</p>\n<p>[foo]</p>\n"
### Failure in: 195:"Example No:196"            
CMarkTests.hs:59
expected: "<p>[foo]: /url 'title</p>\n<p>with blank line'</p>\n<p>[foo]</p>\n"
 but got: "<p>[foo]: /url &#39;title</p>\n<p>with blank line&#39;</p>\n<p>[foo]</p>\n"
### Failure in: 196:"Example No:197"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\">foo</a></p>\n"
 but got: "<p>[foo]:\n/url</p>\n<p>[foo]</p>\n"
### Failure in: 198:"Example No:199"            
CMarkTests.hs:59
expected: "<p><a href=\"\">foo</a></p>\n"
 but got: "<p>[foo]: &lt;&gt;</p>\n<p>[foo]</p>\n"
### Failure in: 199:"Example No:200"            
CMarkTests.hs:59
expected: "<p>[foo]: <bar>(baz)</p>\n<p>[foo]</p>\n"
 but got: "<p>[foo]: &lt;bar&gt;(baz)</p>\n<p>[foo]</p>\n"
### Failure in: 200:"Example No:201"            
CMarkTests.hs:59
expected: "<p><a href=\"/url%5Cbar*baz\" title=\"foo&quot;bar\\baz\">foo</a></p>\n"
 but got: "<p>[foo]: /urlbar*baz &quot;foo&quot;barbaz&quot;</p>\n<p>[foo]</p>\n"
### Failure in: 201:"Example No:202"            
CMarkTests.hs:59
expected: "<p><a href=\"url\">foo</a></p>\n"
 but got: "<p>[foo]</p>\n<p>[foo]: url</p>\n"
### Failure in: 202:"Example No:203"            
CMarkTests.hs:59
expected: "<p><a href=\"first\">foo</a></p>\n"
 but got: "<p>[foo]</p>\n<p>[foo]: first\n[foo]: second</p>\n"
### Failure in: 203:"Example No:204"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\">Foo</a></p>\n"
 but got: "<p>[FOO]: /url</p>\n<p>[Foo]</p>\n"
### Failure in: 204:"Example No:205"            
CMarkTests.hs:59
expected: "<p><a href=\"/%CF%86%CE%BF%CF%85\">\945\947\969</a></p>\n"
 but got: "<p>[\913\915\937]: /\966\959\965</p>\n<p>[\945\947\969]</p>\n"
### Failure in: 205:"Example No:206"            
CMarkTests.hs:59
expected: ""
 but got: "<p>[foo]: /url</p>\n"
### Failure in: 206:"Example No:207"            
CMarkTests.hs:59
expected: "<p>bar</p>\n"
 but got: "<p>[\nfoo\n]: /url\nbar</p>\n"
### Failure in: 208:"Example No:209"            
CMarkTests.hs:59
expected: "<p>&quot;title&quot; ok</p>\n"
 but got: "<p>[foo]: /url\n&quot;title&quot; ok</p>\n"
### Failure in: 209:"Example No:210"            
CMarkTests.hs:59
expected: "<pre><code>[foo]: /url &quot;title&quot;\n</code></pre>\n<p>[foo]</p>\n"
 but got: "<pre><code>[foo]: /url &quot;title&quot;\n\n</code></pre>\n<p>[foo]</p>\n"
### Failure in: 210:"Example No:211"            
CMarkTests.hs:59
expected: "<pre><code>[foo]: /url\n</code></pre>\n<p>[foo]</p>\n"
 but got: "<pre><code>[foo]: /url</code></pre>\n<p>[foo]</p>\n"
### Failure in: 212:"Example No:213"            
CMarkTests.hs:59
expected: "<h1><a href=\"/url\">Foo</a></h1>\n<blockquote>\n<p>bar</p>\n</blockquote>\n"
 but got: "<h1>[Foo]</h1>\n<p>[foo]: /url\n&gt; bar</p>\n"
### Failure in: 213:"Example No:214"            
CMarkTests.hs:59
expected: "<h1>bar</h1>\n<p><a href=\"/url\">foo</a></p>\n"
 but got: "<p>[foo]: /url\nbar\n===\n[foo]</p>\n"
### Failure in: 214:"Example No:215"            
CMarkTests.hs:59
expected: "<p>===\n<a href=\"/url\">foo</a></p>\n"
 but got: "<p>[foo]: /url\n===\n[foo]</p>\n"
### Failure in: 215:"Example No:216"            
CMarkTests.hs:59
expected: "<p><a href=\"/foo-url\" title=\"foo\">foo</a>,\n<a href=\"/bar-url\" title=\"bar\">bar</a>,\n<a href=\"/baz-url\">baz</a></p>\n"
 but got: "<p>[foo]: /foo-url &quot;foo&quot;\n[bar]: /bar-url\n&quot;bar&quot;\n[baz]: /baz-url</p>\n<p>[foo],\n[bar],\n[baz]</p>\n"
### Failure in: 216:"Example No:217"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\">foo</a></p>\n<blockquote>\n</blockquote>\n"
 but got: "<p>[foo]</p>\n<p>&gt; [foo]: /url</p>\n"
### Failure in: 217:"Example No:218"            
CMarkTests.hs:59
expected: ""
 but got: "<p>[foo]: /url</p>\n"
### Failure in: 221:"Example No:222"            
CMarkTests.hs:59
expected: "<p>aaa\nbbb</p>\n"
 but got: "<p>  aaa\nbbb</p>\n"
### Failure in: 223:"Example No:224"            
CMarkTests.hs:59
expected: "<p>aaa\nbbb</p>\n"
 but got: "<p>   aaa\nbbb</p>\n"
### Failure in: 226:"Example No:227"            
CMarkTests.hs:59
expected: "<p>aaa</p>\n<h1>aaa</h1>\n"
 but got: "<p></p>\n<p>aaa</p>\n<p></p>\n<h1>aaa</h1>\n<p></p>\n"
### Failure in: 227:"Example No:228"            
CMarkTests.hs:59
expected: "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
 but got: "<p>&gt; # Foo\n&gt; bar\n&gt; baz</p>\n"
### Failure in: 228:"Example No:229"            
CMarkTests.hs:59
expected: "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
 but got: "<p>&gt;# Foo\n&gt;bar\n&gt; baz</p>\n"
### Failure in: 229:"Example No:230"            
CMarkTests.hs:59
expected: "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
 but got: "<p>   &gt; # Foo\n&gt; bar\n&gt; baz</p>\n"
### Failure in: 231:"Example No:232"            
CMarkTests.hs:59
expected: "<blockquote>\n<h1>Foo</h1>\n<p>bar\nbaz</p>\n</blockquote>\n"
 but got: "<p>&gt; # Foo\n&gt; bar\nbaz</p>\n"
### Failure in: 232:"Example No:233"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>bar\nbaz\nfoo</p>\n</blockquote>\n"
 but got: "<p>&gt; bar\nbaz\n&gt; foo</p>\n"
### Failure in: 233:"Example No:234"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo</p>\n</blockquote>\n<hr />\n"
 but got: "<p>&gt; foo</p>\n<hr />\n"
### Failure in: 234:"Example No:235"            
CMarkTests.hs:59
expected: "<blockquote>\n<ul>\n<li>foo</li>\n</ul>\n</blockquote>\n<ul>\n<li>bar</li>\n</ul>\n"
 but got: "<p>&gt; - foo</p>\n<ul><li>bar\n</li></ul>\n"
### Failure in: 235:"Example No:236"            
CMarkTests.hs:59
expected: "<blockquote>\n<pre><code>foo\n</code></pre>\n</blockquote>\n<pre><code>bar\n</code></pre>\n"
 but got: "<p>&gt;     foo\nbar</p>\n"
### Failure in: 236:"Example No:237"            
CMarkTests.hs:59
expected: "<blockquote>\n<pre><code></code></pre>\n</blockquote>\n<p>foo</p>\n<pre><code></code></pre>\n"
 but got: "<p>&gt; <code> foo </code></p>\n"
### Failure in: 237:"Example No:238"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo\n- bar</p>\n</blockquote>\n"
 but got: "<p>&gt; foo</p>\n<pre><code>- bar\n</code></pre>\n"
### Failure in: 238:"Example No:239"            
CMarkTests.hs:59
expected: "<blockquote>\n</blockquote>\n"
 but got: "<p>&gt;</p>\n"
### Failure in: 239:"Example No:240"            
CMarkTests.hs:59
expected: "<blockquote>\n</blockquote>\n"
 but got: "<p>&gt;\n&gt;<br />\n&gt;</p>\n"
### Failure in: 240:"Example No:241"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo</p>\n</blockquote>\n"
 but got: "<p>&gt;\n&gt; foo\n&gt;</p>\n"
### Failure in: 241:"Example No:242"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo</p>\n</blockquote>\n<blockquote>\n<p>bar</p>\n</blockquote>\n"
 but got: "<p>&gt; foo</p>\n<p>&gt; bar</p>\n"
### Failure in: 242:"Example No:243"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo\nbar</p>\n</blockquote>\n"
 but got: "<p>&gt; foo\n&gt; bar</p>\n"
### Failure in: 243:"Example No:244"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>foo</p>\n<p>bar</p>\n</blockquote>\n"
 but got: "<p>&gt; foo\n&gt;\n&gt; bar</p>\n"
### Failure in: 244:"Example No:245"            
CMarkTests.hs:59
expected: "<p>foo</p>\n<blockquote>\n<p>bar</p>\n</blockquote>\n"
 but got: "<p>foo\n&gt; bar</p>\n"
### Failure in: 245:"Example No:246"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>aaa</p>\n</blockquote>\n<hr />\n<blockquote>\n<p>bbb</p>\n</blockquote>\n"
 but got: "<p>&gt; aaa</p>\n<hr />\n<p>&gt; bbb</p>\n"
### Failure in: 246:"Example No:247"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>bar\nbaz</p>\n</blockquote>\n"
 but got: "<p>&gt; bar\nbaz</p>\n"
### Failure in: 247:"Example No:248"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>bar</p>\n</blockquote>\n<p>baz</p>\n"
 but got: "<p>&gt; bar</p>\n<p>baz</p>\n"
### Failure in: 248:"Example No:249"            
CMarkTests.hs:59
expected: "<blockquote>\n<p>bar</p>\n</blockquote>\n<p>baz</p>\n"
 but got: "<p>&gt; bar\n&gt;\nbaz</p>\n"
### Failure in: 249:"Example No:250"            
CMarkTests.hs:59
expected: "<blockquote>\n<blockquote>\n<blockquote>\n<p>foo\nbar</p>\n</blockquote>\n</blockquote>\n</blockquote>\n"
 but got: "<p>&gt; &gt; &gt; foo\nbar</p>\n"
### Failure in: 250:"Example No:251"            
CMarkTests.hs:59
expected: "<blockquote>\n<blockquote>\n<blockquote>\n<p>foo\nbar\nbaz</p>\n</blockquote>\n</blockquote>\n</blockquote>\n"
 but got: "<p>&gt;&gt;&gt; foo\n&gt; bar\n&gt;&gt;baz</p>\n"
### Failure in: 251:"Example No:252"            
CMarkTests.hs:59
expected: "<blockquote>\n<pre><code>code\n</code></pre>\n</blockquote>\n<blockquote>\n<p>not code</p>\n</blockquote>\n"
 but got: "<p>&gt;     code</p>\n<p>&gt;    not code</p>\n"
### Failure in: 252:"Example No:253"            
CMarkTests.hs:59
expected: "<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n"
 but got: "<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n\n</code></pre>\n<p>&gt; A block quote.</p>\n"
### Failure in: 253:"Example No:254"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li>A paragraph\nwith two lines.\n<pre><code>indented code\n\n&gt; A block quote.\n</code></pre>\n</li></ol>\n"
### Failure in: 254:"Example No:255"            
CMarkTests.hs:59
expected: "<ul>\n<li>one</li>\n</ul>\n<p>two</p>\n"
 but got: "<ul><li>one\n</li></ul>\n<p> two</p>\n"
### Failure in: 255:"Example No:256"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ul>\n"
 but got: "<ul><li>one\ntwo\n</li></ul>\n"
### Failure in: 256:"Example No:257"            
CMarkTests.hs:59
expected: "<ul>\n<li>one</li>\n</ul>\n<pre><code> two\n</code></pre>\n"
 but got: "<ul><li>one\n</li></ul>\n<pre><code> two\n</code></pre>\n"
### Failure in: 257:"Example No:258"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ul>\n"
 but got: "<ul><li>one\ntwo\n</li></ul>\n"
### Failure in: 258:"Example No:259"            
CMarkTests.hs:59
expected: "<blockquote>\n<blockquote>\n<ol>\n<li>\n<p>one</p>\n<p>two</p>\n</li>\n</ol>\n</blockquote>\n</blockquote>\n"
 but got: "<p>   &gt; &gt; 1.  one\n&gt;&gt;\n&gt;&gt;     two</p>\n"
### Failure in: 259:"Example No:260"            
CMarkTests.hs:59
expected: "<blockquote>\n<blockquote>\n<ul>\n<li>one</li>\n</ul>\n<p>two</p>\n</blockquote>\n</blockquote>\n"
 but got: "<p>&gt;&gt;- one\n&gt;&gt;\n&gt;  &gt; two</p>\n"
### Failure in: 261:"Example No:262"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\nbar\n</li></ul>\n"
### Failure in: 262:"Example No:263"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n<p>baz</p>\n<blockquote>\n<p>bam</p>\n</blockquote>\n</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li>foo\n<pre><code>    bar</code></pre>\nbaz\n&gt; bam\n</li></ol>\n"
### Failure in: 263:"Example No:264"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>Foo</p>\n<pre><code>bar\n\n\nbaz\n</code></pre>\n</li>\n</ul>\n"
 but got: "<ul><li>Foo\n<pre><code>bar\n\n\n  baz\n</code></pre>\n</li></ul>\n"
### Failure in: 264:"Example No:265"            
CMarkTests.hs:59
expected: "<ol start=\"123456789\">\n<li>ok</li>\n</ol>\n"
 but got: "<ol start=\"123456789\"><li>ok\n</li></ol>\n"
### Failure in: 266:"Example No:267"            
CMarkTests.hs:59
expected: "<ol start=\"0\">\n<li>ok</li>\n</ol>\n"
 but got: "<ol start=\"0\"><li>ok\n</li></ol>\n"
### Failure in: 267:"Example No:268"            
CMarkTests.hs:59
expected: "<ol start=\"3\">\n<li>ok</li>\n</ol>\n"
 but got: "<ol start=\"3\"><li>ok\n</li></ol>\n"
### Failure in: 269:"Example No:270"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\n<pre><code>bar\n</code></pre>\n</li></ul>\n"
### Failure in: 270:"Example No:271"            
CMarkTests.hs:59
expected: "<ol start=\"10\">\n<li>\n<p>foo</p>\n<pre><code>bar\n</code></pre>\n</li>\n</ol>\n"
 but got: "<p>  10.  foo</p>\n<pre><code>       bar\n</code></pre>\n"
### Failure in: 271:"Example No:272"            
CMarkTests.hs:59
expected: "<pre><code>indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n"
 but got: "<pre><code>indented code\n\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n"
### Failure in: 272:"Example No:273"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<pre><code>indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li>indented code\n</li></ol>\n<p>   paragraph</p>\n<pre><code>   more code\n</code></pre>\n"
### Failure in: 273:"Example No:274"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<pre><code> indented code\n</code></pre>\n<p>paragraph</p>\n<pre><code>more code\n</code></pre>\n</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li>indented code\n</li></ol>\n<p>   paragraph</p>\n<pre><code>   more code\n</code></pre>\n"
### Failure in: 274:"Example No:275"            
CMarkTests.hs:59
expected: "<p>foo</p>\n<p>bar</p>\n"
 but got: "<p>   foo</p>\n<p>bar</p>\n"
### Failure in: 275:"Example No:276"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n</ul>\n<p>bar</p>\n"
 but got: "<ul><li>foo\n</li></ul>\n<p>  bar</p>\n"
### Failure in: 276:"Example No:277"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<p>bar</p>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\nbar\n</li></ul>\n"
### Failure in: 277:"Example No:278"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n<li>\n<pre><code>bar\n</code></pre>\n</li>\n<li>\n<pre><code>baz\n</code></pre>\n</li>\n</ul>\n"
 but got: "<p>-\nfoo\n-</p>\n<pre><code>  bar</code></pre>\n<p>-\nbaz</p>\n"
### Failure in: 278:"Example No:279"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n</ul>\n"
 but got: "<ul><li>\nfoo\n</li></ul>\n"
### Failure in: 279:"Example No:280"            
CMarkTests.hs:59
expected: "<ul>\n<li></li>\n</ul>\n<p>foo</p>\n"
 but got: "<p>-</p>\n<p>  foo</p>\n"
### Failure in: 280:"Example No:281"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ul>\n"
 but got: "<ul><li>foo\n-\n</li><li>bar\n</li></ul>\n"
### Failure in: 281:"Example No:282"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ul>\n"
 but got: "<ul><li>foo\n</li><li>\n- bar\n</li></ul>\n"
### Failure in: 282:"Example No:283"            
CMarkTests.hs:59
expected: "<ol>\n<li>foo</li>\n<li></li>\n<li>bar</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li>foo\n2.\n</li><li>bar\n</li></ol>\n"
### Failure in: 283:"Example No:284"            
CMarkTests.hs:59
expected: "<ul>\n<li></li>\n</ul>\n"
 but got: "<p>*</p>\n"
### Failure in: 285:"Example No:286"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
 but got: "<p> 1.  A paragraph\nwith two lines.</p>\n<pre><code>     indented code\n\n &gt; A block quote.\n</code></pre>\n"
### Failure in: 286:"Example No:287"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
 but got: "<p>  1.  A paragraph\nwith two lines.</p>\n<pre><code>      indented code\n\n  &gt; A block quote.\n</code></pre>\n"
### Failure in: 287:"Example No:288"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
 but got: "<p>   1.  A paragraph\nwith two lines.</p>\n<pre><code>       indented code\n\n   &gt; A block quote.\n</code></pre>\n"
### Failure in: 289:"Example No:290"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>A paragraph\nwith two lines.</p>\n<pre><code>indented code\n</code></pre>\n<blockquote>\n<p>A block quote.</p>\n</blockquote>\n</li>\n</ol>\n"
 but got: "<p>  1.  A paragraph\nwith two lines.</p>\n<pre><code>      indented code\n\n  &gt; A block quote.\n</code></pre>\n"
### Failure in: 290:"Example No:291"            
CMarkTests.hs:59
expected: "<ol>\n<li>A paragraph\nwith two lines.</li>\n</ol>\n"
 but got: "<p>  1.  A paragraph\nwith two lines.</p>\n"
### Failure in: 291:"Example No:292"            
CMarkTests.hs:59
expected: "<blockquote>\n<ol>\n<li>\n<blockquote>\n<p>Blockquote\ncontinued here.</p>\n</blockquote>\n</li>\n</ol>\n</blockquote>\n"
 but got: "<p>&gt; 1. &gt; Blockquote\ncontinued here.</p>\n"
### Failure in: 292:"Example No:293"            
CMarkTests.hs:59
expected: "<blockquote>\n<ol>\n<li>\n<blockquote>\n<p>Blockquote\ncontinued here.</p>\n</blockquote>\n</li>\n</ol>\n</blockquote>\n"
 but got: "<p>&gt; 1. &gt; Blockquote\n&gt; continued here.</p>\n"
### Failure in: 293:"Example No:294"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>baz\n<ul>\n<li>boo</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\n<ul><li>bar\n<ul><li>baz\n<ul><li>boo\n</li></ul>\n</li></ul>\n</li></ul>\n</li></ul>\n"
### Failure in: 294:"Example No:295"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n<li>bar</li>\n<li>baz</li>\n<li>boo</li>\n</ul>\n"
 but got: "<ul><li>foo\n</li><li>bar\n</li><li>baz\n</li><li>boo\n</li></ul>\n"
### Failure in: 295:"Example No:296"            
CMarkTests.hs:59
expected: "<ol start=\"10\">\n<li>foo\n<ul>\n<li>bar</li>\n</ul>\n</li>\n</ol>\n"
 but got: "<p>10) foo</p>\n<pre><code>- bar\n</code></pre>\n"
### Failure in: 296:"Example No:297"            
CMarkTests.hs:59
expected: "<ol start=\"10\">\n<li>foo</li>\n</ol>\n<ul>\n<li>bar</li>\n</ul>\n"
 but got: "<p>10) foo</p>\n<ul><li>bar\n</li></ul>\n"
### Failure in: 297:"Example No:298"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<ul>\n<li>foo</li>\n</ul>\n</li>\n</ul>\n"
 but got: "<ul><li><ul><li>foo\n</li></ul>\n</li></ul>\n"
### Failure in: 298:"Example No:299"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<ul>\n<li>\n<ol start=\"2\">\n<li>foo</li>\n</ol>\n</li>\n</ul>\n</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li><ul><li><ol start=\"2\"><li>foo\n</li></ol>\n</li></ul>\n</li></ol>\n"
### Failure in: 299:"Example No:300"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<h1>Foo</h1>\n</li>\n<li>\n<h2>Bar</h2>\nbaz</li>\n</ul>\n"
 but got: "<ul><li><h1>Foo</h1>\n</li><li>Bar\n<hr />\nbaz\n</li></ul>\n"
### Failure in: 300:"Example No:301"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n<li>bar</li>\n</ul>\n<ul>\n<li>baz</li>\n</ul>\n"
 but got: "<ul><li>foo\n</li><li>bar\n</li><li>baz\n</li></ul>\n"
### Failure in: 301:"Example No:302"            
CMarkTests.hs:59
expected: "<ol>\n<li>foo</li>\n<li>bar</li>\n</ol>\n<ol start=\"3\">\n<li>baz</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li>foo\n</li><li>bar\n3) baz\n</li></ol>\n"
### Failure in: 302:"Example No:303"            
CMarkTests.hs:59
expected: "<p>Foo</p>\n<ul>\n<li>bar</li>\n<li>baz</li>\n</ul>\n"
 but got: "<p>Foo</p>\n<ul><li>bar\n</li><li>baz\n</li></ul>\n"
### Failure in: 303:"Example No:304"            
CMarkTests.hs:59
expected: "<p>The number of windows in my house is\n14.  The number of doors is 6.</p>\n"
 but got: "<p>The number of windows in my house is</p>\n<ol start=\"14\"><li>The number of doors is 6.\n</li></ol>\n"
### Failure in: 304:"Example No:305"            
CMarkTests.hs:59
expected: "<p>The number of windows in my house is</p>\n<ol>\n<li>The number of doors is 6.</li>\n</ol>\n"
 but got: "<p>The number of windows in my house is</p>\n<ol start=\"1\"><li>The number of doors is 6.\n</li></ol>\n"
### Failure in: 305:"Example No:306"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n</li>\n<li>\n<p>bar</p>\n</li>\n<li>\n<p>baz</p>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\n</li><li>bar\n</li><li>baz\n</li></ul>\n"
### Failure in: 306:"Example No:307"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo\n<ul>\n<li>bar\n<ul>\n<li>\n<p>baz</p>\n<p>bim</p>\n</li>\n</ul>\n</li>\n</ul>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\n<ul><li>bar\n<ul><li>baz\n  bim\n</li></ul>\n</li></ul>\n</li></ul>\n"
### Failure in: 307:"Example No:308"            
CMarkTests.hs:59
expected: "<ul>\n<li>foo</li>\n<li>bar</li>\n</ul>\n<!-- -->\n<ul>\n<li>baz</li>\n<li>bim</li>\n</ul>\n"
 but got: "<ul><li>foo\n</li><li>bar\n</li></ul>\n<p>&lt;!-- --&gt;</p>\n<ul><li>baz\n</li><li>bim\n</li></ul>\n"
### Failure in: 308:"Example No:309"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<p>notcode</p>\n</li>\n<li>\n<p>foo</p>\n</li>\n</ul>\n<!-- -->\n<pre><code>code\n</code></pre>\n"
 but got: "<ul><li>foo\nnotcode\n</li><li>foo\n</li></ul>\n<p>&lt;!-- --&gt;</p>\n<pre><code>code\n</code></pre>\n"
### Failure in: 309:"Example No:310"            
CMarkTests.hs:59
expected: "<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n<li>d</li>\n<li>e</li>\n<li>f</li>\n<li>g</li>\n</ul>\n"
 but got: "<ul><li>a\n</li><li>b\n</li><li>c\n</li><li>d\n</li><li>e\n</li><li>f\n</li><li>g\n</li></ul>\n"
### Failure in: 310:"Example No:311"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>c</p>\n</li>\n</ol>\n"
 but got: "<p>1. a</p>\n<p>  2. b</p>\n<p>   3. c</p>\n"
### Failure in: 311:"Example No:312"            
CMarkTests.hs:59
expected: "<ul>\n<li>a</li>\n<li>b</li>\n<li>c</li>\n<li>d\n- e</li>\n</ul>\n"
 but got: "<ul><li>a\n</li><li>b\n</li><li>c\n</li><li>d\n</li><li>e\n</li></ul>\n"
### Failure in: 312:"Example No:313"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n</ol>\n<pre><code>3. c\n</code></pre>\n"
 but got: "<p>1. a</p>\n<p>  2. b</p>\n<pre><code>3. c\n</code></pre>\n"
### Failure in: 313:"Example No:314"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>c</p>\n</li>\n</ul>\n"
 but got: "<ul><li>a\n</li><li>b\n</li><li>c\n</li></ul>\n"
### Failure in: 314:"Example No:315"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>a</p>\n</li>\n<li></li>\n<li>\n<p>c</p>\n</li>\n</ul>\n"
 but got: "<ul><li>a\n*\n</li><li>c\n</li></ul>\n"
### Failure in: 315:"Example No:316"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n<p>c</p>\n</li>\n<li>\n<p>d</p>\n</li>\n</ul>\n"
 but got: "<ul><li>a\n</li><li>b\nc\n</li><li>d\n</li></ul>\n"
### Failure in: 316:"Example No:317"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>a</p>\n</li>\n<li>\n<p>b</p>\n</li>\n<li>\n<p>d</p>\n</li>\n</ul>\n"
 but got: "<ul><li>a\n</li><li>b\n[ref]: /url\n</li><li>d\n</li></ul>\n"
### Failure in: 317:"Example No:318"            
CMarkTests.hs:59
expected: "<ul>\n<li>a</li>\n<li>\n<pre><code>b\n\n\n</code></pre>\n</li>\n<li>c</li>\n</ul>\n"
 but got: "<ul><li>a\n</li><li><pre><code>  b\n\n</code></pre>\n</li><li>c\n</li></ul>\n"
### Failure in: 318:"Example No:319"            
CMarkTests.hs:59
expected: "<ul>\n<li>a\n<ul>\n<li>\n<p>b</p>\n<p>c</p>\n</li>\n</ul>\n</li>\n<li>d</li>\n</ul>\n"
 but got: "<ul><li>a\n<ul><li>b\n  c\n</li><li>d\n</li></ul>\n</li></ul>\n"
### Failure in: 319:"Example No:320"            
CMarkTests.hs:59
expected: "<ul>\n<li>a\n<blockquote>\n<p>b</p>\n</blockquote>\n</li>\n<li>c</li>\n</ul>\n"
 but got: "<ul><li>a\n&gt; b\n&gt;\n</li><li>c\n</li></ul>\n"
### Failure in: 320:"Example No:321"            
CMarkTests.hs:59
expected: "<ul>\n<li>a\n<blockquote>\n<p>b</p>\n</blockquote>\n<pre><code>c\n</code></pre>\n</li>\n<li>d</li>\n</ul>\n"
 but got: "<ul><li>a\n&gt; b\n<pre><code>  c</code></pre>\n</li><li>d\n</li></ul>\n"
### Failure in: 321:"Example No:322"            
CMarkTests.hs:59
expected: "<ul>\n<li>a</li>\n</ul>\n"
 but got: "<ul><li>a\n</li></ul>\n"
### Failure in: 322:"Example No:323"            
CMarkTests.hs:59
expected: "<ul>\n<li>a\n<ul>\n<li>b</li>\n</ul>\n</li>\n</ul>\n"
 but got: "<ul><li>a\n<ul><li>b\n</li></ul>\n</li></ul>\n"
### Failure in: 323:"Example No:324"            
CMarkTests.hs:59
expected: "<ol>\n<li>\n<pre><code>foo\n</code></pre>\n<p>bar</p>\n</li>\n</ol>\n"
 but got: "<ol start=\"1\"><li><pre><code>   foo</code></pre>\nbar\n</li></ol>\n"
### Failure in: 324:"Example No:325"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>foo</p>\n<ul>\n<li>bar</li>\n</ul>\n<p>baz</p>\n</li>\n</ul>\n"
 but got: "<ul><li>foo\n<ul><li>bar\nbaz\n</li></ul>\n</li></ul>\n"
### Failure in: 325:"Example No:326"            
CMarkTests.hs:59
expected: "<ul>\n<li>\n<p>a</p>\n<ul>\n<li>b</li>\n<li>c</li>\n</ul>\n</li>\n<li>\n<p>d</p>\n<ul>\n<li>e</li>\n<li>f</li>\n</ul>\n</li>\n</ul>\n"
 but got: "<ul><li>a\n<ul><li>b\n<ul><li>c\n</li><li>d\n<ul><li>e\n<ul><li>f\n</li></ul>\n</li></ul>\n</li></ul>\n</li></ul>\n</li></ul>\n"
### Failure in: 328:"Example No:329"            
CMarkTests.hs:59
expected: "<p><code>foo ` bar</code></p>\n"
 but got: "<p><code></code> foo <code> bar </code>`</p>\n"
### Failure in: 329:"Example No:330"            
CMarkTests.hs:59
expected: "<p><code>``</code></p>\n"
 but got: "<p><code>  </code></p>\n"
### Failure in: 330:"Example No:331"            
CMarkTests.hs:59
expected: "<p><code> `` </code></p>\n"
 but got: "<p><code>    </code></p>\n"
### Failure in: 334:"Example No:335"            
CMarkTests.hs:59
expected: "<p><code>foo bar   baz</code></p>\n"
 but got: "<p><code> foo bar   baz </code></p>\n"
### Failure in: 335:"Example No:336"            
CMarkTests.hs:59
expected: "<p><code>foo </code></p>\n"
 but got: "<p><code> foo  </code></p>\n"
### Failure in: 338:"Example No:339"            
CMarkTests.hs:59
expected: "<p><code>foo`bar</code></p>\n"
 but got: "<p><code></code>foo<code>bar</code>`</p>\n"
### Failure in: 339:"Example No:340"            
CMarkTests.hs:59
expected: "<p><code>foo `` bar</code></p>\n"
 but got: "<p><code> foo  bar </code></p>\n"
### Failure in: 343:"Example No:344"            
CMarkTests.hs:59
expected: "<p><a href=\"`\">`</p>\n"
 but got: "<p>&lt;a href=&quot;<code>&quot;&gt;</code></p>\n"
### Failure in: 345:"Example No:346"            
CMarkTests.hs:59
expected: "<p><a href=\"http://foo.bar.%60baz\">http://foo.bar.`baz</a>`</p>\n"
 but got: "<p>&lt;http://foo.bar.<code>baz&gt;</code></p>\n"
### Failure in: 346:"Example No:347"            
CMarkTests.hs:59
expected: "<p>```foo``</p>\n"
 but got: "<p><code>foo</code>`</p>\n"
### Failure in: 348:"Example No:349"            
CMarkTests.hs:59
expected: "<p>`foo<code>bar</code></p>\n"
 but got: "<p><code>foobar</code>`</p>\n"
### Failure in: 350:"Example No:351"            
CMarkTests.hs:59
expected: "<p>a * foo bar*</p>\n"
 but got: "<p>a <em> foo bar</em></p>\n"
### Failure in: 351:"Example No:352"            
CMarkTests.hs:59
expected: "<p>a*&quot;foo&quot;*</p>\n"
 but got: "<p>a<em>&quot;foo&quot;</em></p>\n"
### Failure in: 352:"Example No:353"            
CMarkTests.hs:59
expected: "<p>*\160a\160*</p>\n"
 but got: "<p><em>\160a\160</em></p>\n"
### Failure in: 356:"Example No:357"            
CMarkTests.hs:59
expected: "<p>_ foo bar_</p>\n"
 but got: "<p><em> foo bar</em></p>\n"
### Failure in: 357:"Example No:358"            
CMarkTests.hs:59
expected: "<p>a_&quot;foo&quot;_</p>\n"
 but got: "<p>a<em>&quot;foo&quot;</em></p>\n"
### Failure in: 358:"Example No:359"            
CMarkTests.hs:59
expected: "<p>foo_bar_</p>\n"
 but got: "<p>foo<em>bar</em></p>\n"
### Failure in: 359:"Example No:360"            
CMarkTests.hs:59
expected: "<p>5_6_78</p>\n"
 but got: "<p>5<em>6</em>78</p>\n"
### Failure in: 360:"Example No:361"            
CMarkTests.hs:59
expected: "<p>\1087\1088\1080\1089\1090\1072\1085\1103\1084_\1089\1090\1088\1077\1084\1103\1090\1089\1103_</p>\n"
 but got: "<p>\1087\1088\1080\1089\1090\1072\1085\1103\1084<em>\1089\1090\1088\1077\1084\1103\1090\1089\1103</em></p>\n"
### Failure in: 361:"Example No:362"            
CMarkTests.hs:59
expected: "<p>aa_&quot;bb&quot;_cc</p>\n"
 but got: "<p>aa<em>&quot;bb&quot;</em>cc</p>\n"
### Failure in: 364:"Example No:365"            
CMarkTests.hs:59
expected: "<p>*foo bar *</p>\n"
 but got: "<p><em>foo bar </em></p>\n"
### Failure in: 365:"Example No:366"            
CMarkTests.hs:59
expected: "<p>*foo bar\n*</p>\n"
 but got: "<p><em>foo bar</em></p>\n"
### Failure in: 366:"Example No:367"            
CMarkTests.hs:59
expected: "<p>*(*foo)</p>\n"
 but got: "<p><em>(</em>foo)</p>\n"
### Failure in: 367:"Example No:368"            
CMarkTests.hs:59
expected: "<p><em>(<em>foo</em>)</em></p>\n"
 but got: "<p><em>(</em>foo<em>)</em></p>\n"
### Failure in: 369:"Example No:370"            
CMarkTests.hs:59
expected: "<p>_foo bar _</p>\n"
 but got: "<p><em>foo bar </em></p>\n"
### Failure in: 370:"Example No:371"            
CMarkTests.hs:59
expected: "<p>_(_foo)</p>\n"
 but got: "<p><em>(</em>foo)</p>\n"
### Failure in: 371:"Example No:372"            
CMarkTests.hs:59
expected: "<p><em>(<em>foo</em>)</em></p>\n"
 but got: "<p><em>(</em>foo<em>)</em></p>\n"
### Failure in: 372:"Example No:373"            
CMarkTests.hs:59
expected: "<p>_foo_bar</p>\n"
 but got: "<p><em>foo</em>bar</p>\n"
### Failure in: 373:"Example No:374"            
CMarkTests.hs:59
expected: "<p>_\1087\1088\1080\1089\1090\1072\1085\1103\1084_\1089\1090\1088\1077\1084\1103\1090\1089\1103</p>\n"
 but got: "<p><em>\1087\1088\1080\1089\1090\1072\1085\1103\1084</em>\1089\1090\1088\1077\1084\1103\1090\1089\1103</p>\n"
### Failure in: 374:"Example No:375"            
CMarkTests.hs:59
expected: "<p><em>foo_bar_baz</em></p>\n"
 but got: "<p><em>foo</em>bar<em>baz</em></p>\n"
### Failure in: 377:"Example No:378"            
CMarkTests.hs:59
expected: "<p>** foo bar**</p>\n"
 but got: "<p><strong> foo bar</strong></p>\n"
### Failure in: 378:"Example No:379"            
CMarkTests.hs:59
expected: "<p>a**&quot;foo&quot;**</p>\n"
 but got: "<p>a<strong>&quot;foo&quot;</strong></p>\n"
### Failure in: 381:"Example No:382"            
CMarkTests.hs:59
expected: "<p>__ foo bar__</p>\n"
 but got: "<p><strong> foo bar</strong></p>\n"
### Failure in: 382:"Example No:383"            
CMarkTests.hs:59
expected: "<p>__\nfoo bar__</p>\n"
 but got: "<p><strong>\nfoo bar</strong></p>\n"
### Failure in: 383:"Example No:384"            
CMarkTests.hs:59
expected: "<p>a__&quot;foo&quot;__</p>\n"
 but got: "<p>a<strong>&quot;foo&quot;</strong></p>\n"
### Failure in: 384:"Example No:385"            
CMarkTests.hs:59
expected: "<p>foo__bar__</p>\n"
 but got: "<p>foo<strong>bar</strong></p>\n"
### Failure in: 385:"Example No:386"            
CMarkTests.hs:59
expected: "<p>5__6__78</p>\n"
 but got: "<p>5<strong>6</strong>78</p>\n"
### Failure in: 386:"Example No:387"            
CMarkTests.hs:59
expected: "<p>\1087\1088\1080\1089\1090\1072\1085\1103\1084__\1089\1090\1088\1077\1084\1103\1090\1089\1103__</p>\n"
 but got: "<p>\1087\1088\1080\1089\1090\1072\1085\1103\1084<strong>\1089\1090\1088\1077\1084\1103\1090\1089\1103</strong></p>\n"
### Failure in: 387:"Example No:388"            
CMarkTests.hs:59
expected: "<p><strong>foo, <strong>bar</strong>, baz</strong></p>\n"
 but got: "<p><strong>foo, </strong>bar<strong>, baz</strong></p>\n"
### Failure in: 389:"Example No:390"            
CMarkTests.hs:59
expected: "<p>**foo bar **</p>\n"
 but got: "<p><strong>foo bar </strong></p>\n"
### Failure in: 390:"Example No:391"            
CMarkTests.hs:59
expected: "<p>**(**foo)</p>\n"
 but got: "<p><strong>(</strong>foo)</p>\n"
### Failure in: 391:"Example No:392"            
CMarkTests.hs:59
expected: "<p><em>(<strong>foo</strong>)</em></p>\n"
 but got: "<p><em>(foo)</em></p>\n"
### Failure in: 392:"Example No:393"            
CMarkTests.hs:59
expected: "<p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.\n<em>Asclepias physocarpa</em>)</strong></p>\n"
 but got: "<p><strong>Gomphocarpus (<em>Gomphocarpus physocarpus</em>, syn.<em>Asclepias physocarpa</em>)</strong></p>\n"
### Failure in: 395:"Example No:396"            
CMarkTests.hs:59
expected: "<p>__foo bar __</p>\n"
 but got: "<p><strong>foo bar </strong></p>\n"
### Failure in: 396:"Example No:397"            
CMarkTests.hs:59
expected: "<p>__(__foo)</p>\n"
 but got: "<p><strong>(</strong>foo)</p>\n"
### Failure in: 397:"Example No:398"            
CMarkTests.hs:59
expected: "<p><em>(<strong>foo</strong>)</em></p>\n"
 but got: "<p><em>(foo)</em></p>\n"
### Failure in: 398:"Example No:399"            
CMarkTests.hs:59
expected: "<p>__foo__bar</p>\n"
 but got: "<p><strong>foo</strong>bar</p>\n"
### Failure in: 399:"Example No:400"            
CMarkTests.hs:59
expected: "<p>__\1087\1088\1080\1089\1090\1072\1085\1103\1084__\1089\1090\1088\1077\1084\1103\1090\1089\1103</p>\n"
 but got: "<p><strong>\1087\1088\1080\1089\1090\1072\1085\1103\1084</strong>\1089\1090\1088\1077\1084\1103\1090\1089\1103</p>\n"
### Failure in: 400:"Example No:401"            
CMarkTests.hs:59
expected: "<p><strong>foo__bar__baz</strong></p>\n"
 but got: "<p><strong>foo</strong>bar<strong>baz</strong></p>\n"
### Failure in: 404:"Example No:405"            
CMarkTests.hs:59
expected: "<p><em>foo <strong>bar</strong> baz</em></p>\n"
 but got: "<p><em>foo bar baz</em></p>\n"
### Failure in: 405:"Example No:406"            
CMarkTests.hs:59
expected: "<p><em>foo <em>bar</em> baz</em></p>\n"
 but got: "<p><em>foo </em>bar<em> baz</em></p>\n"
### Failure in: 407:"Example No:408"            
CMarkTests.hs:59
expected: "<p><em>foo <em>bar</em></em></p>\n"
 but got: "<p><em>foo </em>bar**</p>\n"
### Failure in: 408:"Example No:409"            
CMarkTests.hs:59
expected: "<p><em>foo <strong>bar</strong> baz</em></p>\n"
 but got: "<p><em>foo bar baz</em></p>\n"
### Failure in: 409:"Example No:410"            
CMarkTests.hs:59
expected: "<p><em>foo<strong>bar</strong>baz</em></p>\n"
 but got: "<p><em>foobarbaz</em></p>\n"
### Failure in: 410:"Example No:411"            
CMarkTests.hs:59
expected: "<p><em>foo**bar</em></p>\n"
 but got: "<p><em>foobar</em></p>\n"
### Failure in: 412:"Example No:413"            
CMarkTests.hs:59
expected: "<p><em>foo <strong>bar</strong></em></p>\n"
 but got: "<p><em>foo bar</em>**</p>\n"
### Failure in: 413:"Example No:414"            
CMarkTests.hs:59
expected: "<p><em>foo<strong>bar</strong></em></p>\n"
 but got: "<p><em>foobar</em>**</p>\n"
### Failure in: 414:"Example No:415"            
CMarkTests.hs:59
expected: "<p>foo<em><strong>bar</strong></em>baz</p>\n"
 but got: "<p>foo<strong><em>bar</em></strong>baz</p>\n"
### Failure in: 415:"Example No:416"            
CMarkTests.hs:59
expected: "<p>foo<strong><strong><strong>bar</strong></strong></strong>***baz</p>\n"
 but got: "<p>foo<strong><strong><strong>bar</strong></strong></strong><em>*</em>baz</p>\n"
### Failure in: 416:"Example No:417"            
CMarkTests.hs:59
expected: "<p><em>foo <strong>bar <em>baz</em> bim</strong> bop</em></p>\n"
 but got: "<p><em>foo bar </em>baz<em> bim bop</em></p>\n"
### Failure in: 419:"Example No:420"            
CMarkTests.hs:59
expected: "<p>**** is not an empty strong emphasis</p>\n"
 but got: "<p>*<em>*</em> is not an empty strong emphasis</p>\n"
### Failure in: 423:"Example No:424"            
CMarkTests.hs:59
expected: "<p><strong>foo <strong>bar</strong> baz</strong></p>\n"
 but got: "<p><strong>foo </strong>bar<strong> baz</strong></p>\n"
### Failure in: 425:"Example No:426"            
CMarkTests.hs:59
expected: "<p><strong>foo <strong>bar</strong></strong></p>\n"
 but got: "<p><strong>foo </strong>bar*<em>*</em></p>\n"
### Failure in: 430:"Example No:431"            
CMarkTests.hs:59
expected: "<p><strong>foo <em>bar <strong>baz</strong>\nbim</em> bop</strong></p>\n"
 but got: "<p><strong>foo <em>bar baz\nbim</em> bop</strong></p>\n"
### Failure in: 433:"Example No:434"            
CMarkTests.hs:59
expected: "<p>____ is not an empty strong emphasis</p>\n"
 but got: "<p>_<em>_</em> is not an empty strong emphasis</p>\n"
### Failure in: 434:"Example No:435"            
CMarkTests.hs:59
expected: "<p>foo ***</p>\n"
 but got: "<p>foo <em>*</em></p>\n"
### Failure in: 437:"Example No:438"            
CMarkTests.hs:59
expected: "<p>foo *****</p>\n"
 but got: "<p>foo <em>*</em>**</p>\n"
### Failure in: 443:"Example No:444"            
CMarkTests.hs:59
expected: "<p>***<em>foo</em></p>\n"
 but got: "<p><em><em>*</em>foo</em></p>\n"
### Failure in: 445:"Example No:446"            
CMarkTests.hs:59
expected: "<p><em>foo</em>***</p>\n"
 but got: "<p><em>foo*</em></p>\n"
### Failure in: 446:"Example No:447"            
CMarkTests.hs:59
expected: "<p>foo ___</p>\n"
 but got: "<p>foo <em>_</em></p>\n"
### Failure in: 449:"Example No:450"            
CMarkTests.hs:59
expected: "<p>foo _____</p>\n"
 but got: "<p>foo <em>_</em>__</p>\n"
### Failure in: 455:"Example No:456"            
CMarkTests.hs:59
expected: "<p>___<em>foo</em></p>\n"
 but got: "<p><em><em>_</em>foo</em></p>\n"
### Failure in: 457:"Example No:458"            
CMarkTests.hs:59
expected: "<p><em>foo</em>___</p>\n"
 but got: "<p><em>foo_</em></p>\n"
### Failure in: 465:"Example No:466"            
CMarkTests.hs:59
expected: "<p><em><strong>foo</strong></em></p>\n"
 but got: "<p><strong><em>foo</em></strong></p>\n"
### Failure in: 466:"Example No:467"            
CMarkTests.hs:59
expected: "<p><em><strong><strong>foo</strong></strong></em></p>\n"
 but got: "<p><strong><strong><em>foo</em></strong></strong></p>\n"
### Failure in: 467:"Example No:468"            
CMarkTests.hs:59
expected: "<p><em>foo _bar</em> baz_</p>\n"
 but got: "<p>*foo <em>bar* baz</em></p>\n"
### Failure in: 468:"Example No:469"            
CMarkTests.hs:59
expected: "<p><em>foo <strong>bar *baz bim</strong> bam</em></p>\n"
 but got: "<p><em>foo __bar </em>baz bim__ bam*</p>\n"
### Failure in: 469:"Example No:470"            
CMarkTests.hs:59
expected: "<p>**foo <strong>bar baz</strong></p>\n"
 but got: "<p><strong>foo </strong>bar baz**</p>\n"
### Failure in: 470:"Example No:471"            
CMarkTests.hs:59
expected: "<p>*foo <em>bar baz</em></p>\n"
 but got: "<p><em>foo </em>bar baz*</p>\n"
### Failure in: 473:"Example No:474"            
CMarkTests.hs:59
expected: "<p>*<img src=\"foo\" title=\"*\"/></p>\n"
 but got: "<p><em>&lt;img src=&quot;foo&quot; title=&quot;</em>&quot;/&gt;</p>\n"
### Failure in: 474:"Example No:475"            
CMarkTests.hs:59
expected: "<p>**<a href=\"**\"></p>\n"
 but got: "<p><strong>&lt;a href=&quot;</strong>&quot;&gt;</p>\n"
### Failure in: 475:"Example No:476"            
CMarkTests.hs:59
expected: "<p>__<a href=\"__\"></p>\n"
 but got: "<p><strong>&lt;a href=&quot;</strong>&quot;&gt;</p>\n"
### Failure in: 482:"Example No:483"            
CMarkTests.hs:59
expected: "<p><a href=\"\">link</a></p>\n"
 but got: "<p><a href>link</a></p>\n"
### Failure in: 483:"Example No:484"            
CMarkTests.hs:59
expected: "<p><a href=\"\">link</a></p>\n"
 but got: "<p><a href>link</a></p>\n"
### Failure in: 485:"Example No:486"            
CMarkTests.hs:59
expected: "<p><a href=\"/my%20uri\">link</a></p>\n"
 but got: "<p><a href=\"/my uri\">link</a></p>\n"
### Failure in: 487:"Example No:488"            
CMarkTests.hs:59
expected: "<p>[link](<foo\nbar>)</p>\n"
 but got: "<p>[link](&lt;foo\nbar&gt;)</p>\n"
### Failure in: 489:"Example No:490"            
CMarkTests.hs:59
expected: "<p>[link](&lt;foo&gt;)</p>\n"
 but got: "<p><a href=\"foo\\\">link</a></p>\n"
### Failure in: 490:"Example No:491"            
CMarkTests.hs:59
expected: "<p>[a](&lt;b)c\n[a](&lt;b)c&gt;\n[a](<b>c)</p>\n"
 but got: "<p><a href=\"&lt;b\">a</a>c\n[a](&lt;b)c&gt;\n[a](&lt;b&gt;c)</p>\n"
### Failure in: 491:"Example No:492"            
CMarkTests.hs:59
expected: "<p><a href=\"(foo)\">link</a></p>\n"
 but got: "<p><a href=\"\\(foo\\\">link</a>)</p>\n"
### Failure in: 492:"Example No:493"            
CMarkTests.hs:59
expected: "<p><a href=\"foo(and(bar))\">link</a></p>\n"
 but got: "<p><a href=\"foo(and(bar\">link</a>))</p>\n"
### Failure in: 493:"Example No:494"            
CMarkTests.hs:59
expected: "<p>[link](foo(and(bar))</p>\n"
 but got: "<p><a href=\"foo(and(bar\">link</a>)</p>\n"
### Failure in: 494:"Example No:495"            
CMarkTests.hs:59
expected: "<p><a href=\"foo(and(bar)\">link</a></p>\n"
 but got: "<p><a href=\"foo\\(and\\(bar\\\">link</a>)</p>\n"
### Failure in: 496:"Example No:497"            
CMarkTests.hs:59
expected: "<p><a href=\"foo):\">link</a></p>\n"
 but got: "<p><a href=\"foo\\\">link</a>:)</p>\n"
### Failure in: 498:"Example No:499"            
CMarkTests.hs:59
expected: "<p><a href=\"foo%5Cbar\">link</a></p>\n"
 but got: "<p><a href=\"foo\\bar\">link</a></p>\n"
### Failure in: 499:"Example No:500"            
CMarkTests.hs:59
expected: "<p><a href=\"foo%20b%C3%A4\">link</a></p>\n"
 but got: "<p><a href=\"foo%20b&amp;auml;\">link</a></p>\n"
### Failure in: 500:"Example No:501"            
CMarkTests.hs:59
expected: "<p><a href=\"%22title%22\">link</a></p>\n"
 but got: "<p><a href=\"&quot;title&quot;\">link</a></p>\n"
### Failure in: 502:"Example No:503"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title &quot;&quot;\">link</a></p>\n"
 but got: "<p>[link](/url &quot;title &quot;&amp;quot;&quot;)</p>\n"
### Failure in: 503:"Example No:504"            
CMarkTests.hs:59
expected: "<p><a href=\"/url%C2%A0%22title%22\">link</a></p>\n"
 but got: "<p><a href=\"/url\160&quot;title&quot;\">link</a></p>\n"
### Failure in: 506:"Example No:507"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\" title=\"title\">link</a></p>\n"
 but got: "<p>[link](   /uri\n&quot;title&quot;  )</p>\n"
### Failure in: 508:"Example No:509"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">link [foo [bar]]</a></p>\n"
 but got: "<p>[link [foo [bar]]](/uri)</p>\n"
### Failure in: 512:"Example No:513"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>\n"
 but got: "<p><a href=\"/uri\">link <em>foo bar <code>#</code></em></a></p>\n"
### Failure in: 513:"Example No:514"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\"><img src=\"moon.jpg\" alt=\"moon\" /></a></p>\n"
 but got: "<p><a href=\"/uri\"><img src=\"moon.jpg\" alt=\"moon\"/></a></p>\n"
### Failure in: 515:"Example No:516"            
CMarkTests.hs:59
expected: "<p>[foo <em>[bar <a href=\"/uri\">baz</a>](/uri)</em>](/uri)</p>\n"
 but got: "<p><a href=\"/uri\">foo <em>[bar <a href=\"/uri\">baz</a>](/uri)</em></a></p>\n"
### Failure in: 516:"Example No:517"            
CMarkTests.hs:59
expected: "<p><img src=\"uri3\" alt=\"[foo](uri2)\" /></p>\n"
 but got: "<p><img src=\"uri1\" alt=\"[[foo\"/>](uri2)](uri3)</p>\n"
### Failure in: 518:"Example No:519"            
CMarkTests.hs:59
expected: "<p><a href=\"baz*\">foo *bar</a></p>\n"
 but got: "<p>[foo <em>bar](baz</em>)</p>\n"
### Failure in: 520:"Example No:521"            
CMarkTests.hs:59
expected: "<p>[foo <bar attr=\"](baz)\"></p>\n"
 but got: "<p><a href=\"baz\">foo &lt;bar attr=&quot;</a>&quot;&gt;</p>\n"
### Failure in: 522:"Example No:523"            
CMarkTests.hs:59
expected: "<p>[foo<a href=\"http://example.com/?search=%5D(uri)\">http://example.com/?search=](uri)</a></p>\n"
 but got: "<p>[foo<a href=\"http://example.com/?search=](uri)\">http://example.com/?search=](uri)</a></p>\n"
### Failure in: 523:"Example No:524"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
 but got: "<p>[foo][bar]</p>\n<p>[bar]: /url &quot;title&quot;</p>\n"
### Failure in: 524:"Example No:525"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">link [foo [bar]]</a></p>\n"
 but got: "<p>[link [foo [bar]]][ref]</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 525:"Example No:526"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">link [bar</a></p>\n"
 but got: "<p>[link [bar][ref]</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 526:"Example No:527"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">link <em>foo <strong>bar</strong> <code>#</code></em></a></p>\n"
 but got: "<p>[link <em>foo bar <code>#</code></em>][ref]</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 527:"Example No:528"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\"><img src=\"moon.jpg\" alt=\"moon\" /></a></p>\n"
 but got: "<p>[<img src=\"moon.jpg\" alt=\"moon\"/>][ref]</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 528:"Example No:529"            
CMarkTests.hs:59
expected: "<p>[foo <a href=\"/uri\">bar</a>]<a href=\"/uri\">ref</a></p>\n"
 but got: "<p>[foo <a href=\"/uri\">bar</a>][ref]</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 529:"Example No:530"            
CMarkTests.hs:59
expected: "<p>[foo <em>bar <a href=\"/uri\">baz</a></em>]<a href=\"/uri\">ref</a></p>\n"
 but got: "<p>[foo <em>bar [baz][ref]</em>][ref]</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 530:"Example No:531"            
CMarkTests.hs:59
expected: "<p>*<a href=\"/uri\">foo*</a></p>\n"
 but got: "<p><em>[foo</em>][ref]</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 531:"Example No:532"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">foo *bar</a>*</p>\n"
 but got: "<p>[foo <em>bar][ref]</em></p>\n<p>[ref]: /uri</p>\n"
### Failure in: 532:"Example No:533"            
CMarkTests.hs:59
expected: "<p>[foo <bar attr=\"][ref]\"></p>\n"
 but got: "<p>[foo &lt;bar attr=&quot;][ref]&quot;&gt;</p>\n<p>[ref]: /uri</p>\n"
### Failure in: 533:"Example No:534"            
CMarkTests.hs:59
expected: "<p>[foo<code>][ref]</code></p>\n"
 but got: "<p>[foo<code>][ref]</code></p>\n<p>[ref]: /uri</p>\n"
### Failure in: 534:"Example No:535"            
CMarkTests.hs:59
expected: "<p>[foo<a href=\"http://example.com/?search=%5D%5Bref%5D\">http://example.com/?search=][ref]</a></p>\n"
 but got: "<p>[foo<a href=\"http://example.com/?search=][ref]\">http://example.com/?search=][ref]</a></p>\n<p>[ref]: /uri</p>\n"
### Failure in: 535:"Example No:536"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
 but got: "<p>[foo][BaR]</p>\n<p>[bar]: /url &quot;title&quot;</p>\n"
### Failure in: 536:"Example No:537"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\">\7838</a></p>\n"
 but got: "<p>[\7838]</p>\n<p>[SS]: /url</p>\n"
### Failure in: 537:"Example No:538"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\">Baz</a></p>\n"
 but got: "<p>[Foo\nbar]: /url</p>\n<p>[Baz][Foo bar]</p>\n"
### Failure in: 538:"Example No:539"            
CMarkTests.hs:59
expected: "<p>[foo] <a href=\"/url\" title=\"title\">bar</a></p>\n"
 but got: "<p>[foo] [bar]</p>\n<p>[bar]: /url &quot;title&quot;</p>\n"
### Failure in: 539:"Example No:540"            
CMarkTests.hs:59
expected: "<p>[foo]\n<a href=\"/url\" title=\"title\">bar</a></p>\n"
 but got: "<p>[foo]\n[bar]</p>\n<p>[bar]: /url &quot;title&quot;</p>\n"
### Failure in: 540:"Example No:541"            
CMarkTests.hs:59
expected: "<p><a href=\"/url1\">bar</a></p>\n"
 but got: "<p>[foo]: /url1</p>\n<p>[foo]: /url2</p>\n<p>[bar][foo]</p>\n"
### Failure in: 541:"Example No:542"            
CMarkTests.hs:59
expected: "<p>[bar][foo!]</p>\n"
 but got: "<p>[bar][foo!]</p>\n<p>[foo!]: /url</p>\n"
### Failure in: 545:"Example No:546"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">foo</a></p>\n"
 but got: "<p>[foo][ref[]</p>\n<p>[ref[]: /uri</p>\n"
### Failure in: 546:"Example No:547"            
CMarkTests.hs:59
expected: "<p><a href=\"/uri\">bar\\</a></p>\n"
 but got: "<p>[bar\\]: /uri</p>\n<p>[bar\\]</p>\n"
### Failure in: 549:"Example No:550"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
 but got: "<p>[foo][]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 550:"Example No:551"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\"><em>foo</em> bar</a></p>\n"
 but got: "<p>[<em>foo</em> bar][]</p>\n<p>[<em>foo</em> bar]: /url &quot;title&quot;</p>\n"
### Failure in: 551:"Example No:552"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">Foo</a></p>\n"
 but got: "<p>[Foo][]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 552:"Example No:553"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">foo</a>\n[]</p>\n"
 but got: "<p>[foo]\n[]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 553:"Example No:554"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">foo</a></p>\n"
 but got: "<p>[foo]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 554:"Example No:555"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\"><em>foo</em> bar</a></p>\n"
 but got: "<p>[<em>foo</em> bar]</p>\n<p>[<em>foo</em> bar]: /url &quot;title&quot;</p>\n"
### Failure in: 555:"Example No:556"            
CMarkTests.hs:59
expected: "<p>[<a href=\"/url\" title=\"title\"><em>foo</em> bar</a>]</p>\n"
 but got: "<p>[[<em>foo</em> bar]]</p>\n<p>[<em>foo</em> bar]: /url &quot;title&quot;</p>\n"
### Failure in: 556:"Example No:557"            
CMarkTests.hs:59
expected: "<p>[[bar <a href=\"/url\">foo</a></p>\n"
 but got: "<p>[[bar [foo]</p>\n<p>[foo]: /url</p>\n"
### Failure in: 557:"Example No:558"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\" title=\"title\">Foo</a></p>\n"
 but got: "<p>[Foo]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 558:"Example No:559"            
CMarkTests.hs:59
expected: "<p><a href=\"/url\">foo</a> bar</p>\n"
 but got: "<p>[foo] bar</p>\n<p>[foo]: /url</p>\n"
### Failure in: 559:"Example No:560"            
CMarkTests.hs:59
expected: "<p>[foo]</p>\n"
 but got: "<p>[foo]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 560:"Example No:561"            
CMarkTests.hs:59
expected: "<p>*<a href=\"/url\">foo*</a></p>\n"
 but got: "<p>[foo*]: /url</p>\n<p><em>[foo</em>]</p>\n"
### Failure in: 561:"Example No:562"            
CMarkTests.hs:59
expected: "<p><a href=\"/url2\">foo</a></p>\n"
 but got: "<p>[foo][bar]</p>\n<p>[foo]: /url1\n[bar]: /url2</p>\n"
### Failure in: 562:"Example No:563"            
CMarkTests.hs:59
expected: "<p><a href=\"/url1\">foo</a></p>\n"
 but got: "<p>[foo][]</p>\n<p>[foo]: /url1</p>\n"
### Failure in: 563:"Example No:564"            
CMarkTests.hs:59
expected: "<p><a href=\"\">foo</a></p>\n"
 but got: "<p><a href>foo</a></p>\n<p>[foo]: /url1</p>\n"
### Failure in: 564:"Example No:565"            
CMarkTests.hs:59
expected: "<p><a href=\"/url1\">foo</a>(not a link)</p>\n"
 but got: "<p>[foo](not a link)</p>\n<p>[foo]: /url1</p>\n"
### Failure in: 565:"Example No:566"            
CMarkTests.hs:59
expected: "<p>[foo]<a href=\"/url\">bar</a></p>\n"
 but got: "<p>[foo][bar][baz]</p>\n<p>[baz]: /url</p>\n"
### Failure in: 566:"Example No:567"            
CMarkTests.hs:59
expected: "<p><a href=\"/url2\">foo</a><a href=\"/url1\">baz</a></p>\n"
 but got: "<p>[foo][bar][baz]</p>\n<p>[baz]: /url1\n[bar]: /url2</p>\n"
### Failure in: 567:"Example No:568"            
CMarkTests.hs:59
expected: "<p>[foo]<a href=\"/url1\">bar</a></p>\n"
 but got: "<p>[foo][bar][baz]</p>\n<p>[baz]: /url1\n[foo]: /url2</p>\n"
### Failure in: 568:"Example No:569"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n"
 but got: "<p><img src=\"/url\" title=\"title\" alt=\"foo\"/></p>\n"
### Failure in: 569:"Example No:570"            
CMarkTests.hs:59
expected: "<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n"
 but got: "<p>![foo <em>bar</em>]</p>\n<p>[foo <em>bar</em>]: train.jpg &quot;train &amp; tracks&quot;</p>\n"
### Failure in: 570:"Example No:571"            
CMarkTests.hs:59
expected: "<p><img src=\"/url2\" alt=\"foo bar\" /></p>\n"
 but got: "<p><img src=\"/url\" alt=\"foo ![bar\"/>](/url2)</p>\n"
### Failure in: 571:"Example No:572"            
CMarkTests.hs:59
expected: "<p><img src=\"/url2\" alt=\"foo bar\" /></p>\n"
 but got: "<p><img src=\"/url\" alt=\"foo [bar\"/>](/url2)</p>\n"
### Failure in: 572:"Example No:573"            
CMarkTests.hs:59
expected: "<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n"
 but got: "<p>![foo <em>bar</em>][]</p>\n<p>[foo <em>bar</em>]: train.jpg &quot;train &amp; tracks&quot;</p>\n"
### Failure in: 573:"Example No:574"            
CMarkTests.hs:59
expected: "<p><img src=\"train.jpg\" alt=\"foo bar\" title=\"train &amp; tracks\" /></p>\n"
 but got: "<p>![foo <em>bar</em>][foobar]</p>\n<p>[FOOBAR]: train.jpg &quot;train &amp; tracks&quot;</p>\n"
### Failure in: 574:"Example No:575"            
CMarkTests.hs:59
expected: "<p><img src=\"train.jpg\" alt=\"foo\" /></p>\n"
 but got: "<p><img src=\"train.jpg\" alt=\"foo\"/></p>\n"
### Failure in: 578:"Example No:579"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo\"/></p>\n"
 but got: "<p>![foo][bar]</p>\n<p>[bar]: /url</p>\n"
### Failure in: 579:"Example No:580"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo\" /></p>\n"
 but got: "<p>![foo][bar]</p>\n<p>[BAR]: /url</p>\n"
### Failure in: 580:"Example No:581"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n"
 but got: "<p>![foo][]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 581:"Example No:582"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo bar\" title=\"title\" /></p>\n"
 but got: "<p>![<em>foo</em> bar][]</p>\n<p>[<em>foo</em> bar]: /url &quot;title&quot;</p>\n"
### Failure in: 582:"Example No:583"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"Foo\" title=\"title\" /></p>\n"
 but got: "<p>![Foo][]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 583:"Example No:584"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo\" title=\"title\" />\n[]</p>\n"
 but got: "<p>![foo]\n[]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 584:"Example No:585"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo\" title=\"title\" /></p>\n"
 but got: "<p>![foo]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 585:"Example No:586"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"foo bar\" title=\"title\" /></p>\n"
 but got: "<p>![<em>foo</em> bar]</p>\n<p>[<em>foo</em> bar]: /url &quot;title&quot;</p>\n"
### Failure in: 587:"Example No:588"            
CMarkTests.hs:59
expected: "<p><img src=\"/url\" alt=\"Foo\" title=\"title\" /></p>\n"
 but got: "<p>![Foo]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 588:"Example No:589"            
CMarkTests.hs:59
expected: "<p>![foo]</p>\n"
 but got: "<p>![foo]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 589:"Example No:590"            
CMarkTests.hs:59
expected: "<p>!<a href=\"/url\" title=\"title\">foo</a></p>\n"
 but got: "<p>![foo]</p>\n<p>[foo]: /url &quot;title&quot;</p>\n"
### Failure in: 599:"Example No:600"            
CMarkTests.hs:59
expected: "<p><a href=\"http://example.com/%5C%5B%5C\">http://example.com/\\[\\</a></p>\n"
 but got: "<p>&lt;http://example.com/[&gt;</p>\n"
### Failure in: 600:"Example No:601"            
CMarkTests.hs:59
expected: "<p><a href=\"mailto:foo@bar.example.com\">foo@bar.example.com</a></p>\n"
 but got: "<p>&lt;foo@bar.example.com&gt;</p>\n"
### Failure in: 601:"Example No:602"            
CMarkTests.hs:59
expected: "<p><a href=\"mailto:foo+special@Bar.baz-bar0.com\">foo+special@Bar.baz-bar0.com</a></p>\n"
 but got: "<p>&lt;foo+special@Bar.baz-bar0.com&gt;</p>\n"
### Failure in: 609:"Example No:610"            
CMarkTests.hs:59
expected: "<p><a><bab><c2c></p>\n"
 but got: "<p>&lt;a&gt;&lt;bab&gt;&lt;c2c&gt;</p>\n"
### Failure in: 610:"Example No:611"            
CMarkTests.hs:59
expected: "<p><a/><b2/></p>\n"
 but got: "<p>&lt;a/&gt;&lt;b2/&gt;</p>\n"
### Failure in: 611:"Example No:612"            
CMarkTests.hs:59
expected: "<p><a  /><b2\ndata=\"foo\" ></p>\n"
 but got: "<p>&lt;a  /&gt;&lt;b2\ndata=&quot;foo&quot; &gt;</p>\n"
### Failure in: 612:"Example No:613"            
CMarkTests.hs:59
expected: "<p><a foo=\"bar\" bam = 'baz <em>\"</em>'\n_boolean zoop:33=zoop:33 /></p>\n"
 but got: "<p>&lt;a foo=&quot;bar&quot; bam = &#39;baz &lt;em&gt;&quot;&lt;/em&gt;&#39;\n_boolean zoop:33=zoop:33 /&gt;</p>\n"
### Failure in: 613:"Example No:614"            
CMarkTests.hs:59
expected: "<p>Foo <responsive-image src=\"foo.jpg\" /></p>\n"
 but got: "<p>Foo &lt;responsive-image src=&quot;foo.jpg&quot; /&gt;</p>\n"
### Failure in: 616:"Example No:617"            
CMarkTests.hs:59
expected: "<p>&lt;a href=&quot;hi'&gt; &lt;a href=hi'&gt;</p>\n"
 but got: "<p>&lt;a href=&quot;hi&#39;&gt; &lt;a href=hi&#39;&gt;</p>\n"
### Failure in: 618:"Example No:619"            
CMarkTests.hs:59
expected: "<p>&lt;a href='bar'title=title&gt;</p>\n"
 but got: "<p>&lt;a href=&#39;bar&#39;title=title&gt;</p>\n"
### Failure in: 619:"Example No:620"            
CMarkTests.hs:59
expected: "<p></a></foo ></p>\n"
 but got: "<p>&lt;/a&gt;&lt;/foo &gt;</p>\n"
### Failure in: 621:"Example No:622"            
CMarkTests.hs:59
expected: "<p>foo <!-- this is a\ncomment - with hyphen --></p>\n"
 but got: "<p>foo &lt;!-- this is a\ncomment - with hyphen --&gt;</p>\n"
### Failure in: 624:"Example No:625"            
CMarkTests.hs:59
expected: "<p>foo <?php echo $a; ?></p>\n"
 but got: "<p>foo &lt;?php echo $a; ?&gt;</p>\n"
### Failure in: 625:"Example No:626"            
CMarkTests.hs:59
expected: "<p>foo <!ELEMENT br EMPTY></p>\n"
 but got: "<p>foo &lt;!ELEMENT br EMPTY&gt;</p>\n"
### Failure in: 626:"Example No:627"            
CMarkTests.hs:59
expected: "<p>foo <![CDATA[>&<]]></p>\n"
 but got: "<p>foo &lt;![CDATA[&gt;&amp;&lt;]]&gt;</p>\n"
### Failure in: 627:"Example No:628"            
CMarkTests.hs:59
expected: "<p>foo <a href=\"&ouml;\"></p>\n"
 but got: "<p>foo &lt;a href=&quot;&amp;ouml;&quot;&gt;</p>\n"
### Failure in: 628:"Example No:629"            
CMarkTests.hs:59
expected: "<p>foo <a href=\"\\*\"></p>\n"
 but got: "<p>foo &lt;a href=&quot;*&quot;&gt;</p>\n"
### Failure in: 631:"Example No:632"            
CMarkTests.hs:59
expected: "<p>foo<br />\nbaz</p>\n"
 but got: ""
### Failure in: 634:"Example No:635"            
CMarkTests.hs:59
expected: "<p>foo<br />\nbar</p>\n"
 but got: ""
### Failure in: 636:"Example No:637"            
CMarkTests.hs:59
expected: "<p><em>foo<br />\nbar</em></p>\n"
 but got: "<p>*</p>\n"
### Failure in: 639:"Example No:640"            
CMarkTests.hs:59
expected: "<p><a href=\"foo  \nbar\"></p>\n"
 but got: "<p>&lt;a href=&quot;foo<br />\nbar&quot;&gt;</p>\n"
### Failure in: 640:"Example No:641"            
CMarkTests.hs:59
expected: "<p><a href=\"foo\\\nbar\"></p>\n"
 but got: "<p>&lt;a</p>\n"
### Failure in: 641:"Example No:642"            
CMarkTests.hs:59
expected: "<p>foo\\</p>\n"
 but got: ""
### Failure in: 643:"Example No:644"            
CMarkTests.hs:59
expected: "<h3>foo\\</h3>\n"
 but got: "<p>###</p>\n"
### Failure in: 647:"Example No:648"            
CMarkTests.hs:59
expected: "<p>hello $.;'there</p>\n"
 but got: "<p>hello $.;&#39;there</p>\n"
Cases: 650  Tried: 650  Errors: 0  Failures: 451
