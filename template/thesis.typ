#import "../lib.typ": thesis, kouhu, codly, codly-init, codly-languages, no-codly


#show: codly-init.with()
#codly(languages: codly-languages)

#let (
  doc,
  cover,
  declare,
  abstract-cn,
  abstract-en,
  mainmatter,
  fence,
  toc,
  nenu-bibliography,
  acknowledgement,
) = thesis(
  thesis-type: "bachelor",
  degree: "academic",
  two-side: false,
  bibliography: bibliography.with("ref.bib"),
  fonts: (:),
  info: (
    title: "基于 Typst 的东北师范大学学士学位论文",
    title-en: "My Thesis in English",
    student-id: "2024123456",
    author: "张三",
    department: "信息科学与技术学院",
    major: "计算机科学与技术",
    supervisor: "李四",
    submit-date: datetime.today(),
  ),
  keywords-cn: ("Typst", "学士学位论文", "东北师范大学", "计算机科学与技术"),
  keywords-en: ("Typst", "Bachelor Thesis", "NENU", "Computer Science"),
)

#show: doc

#cover()

#declare()

#abstract-cn[
  论文第一页为中文内容摘要。应说明目的、研究方法、成果和结论。要突出本论文新的见解，语言力求精练，一般 200 字左右。为了便于文献检索，应在本页下方另起一行注明本文的关键词（三至五个）。

  论文第一页为中文内容摘要。应说明目的、研究方法、成果和结论。要突出本论文新的见解，语言力求精练，一般 200 字左右。为了便于文献检索，应在本页下方另起一行注明本文的关键词（三至五个）。
  论文第一页为中文内容摘要。应说明目的、研究方法、成果和结论。要突出本论文新的见解，语言力求精练，一般 200 字左右。为了便于文献检索，应在本页下方另起一行注明本文的关键词（三至五个）。
]

#abstract-en[
  The first page of the paper should contain an abstract in Chinese. It should state the purpose, research methods, results, and conclusions. The new insights of this paper should be highlighted, and the language should be concise, generally around 200 words. To facilitate literature retrieval, keywords (three to five) should be provided on a new line below the abstract on this page.

  The first page of the paper should contain an abstract in Chinese. It should state the purpose, research methods, results, and conclusions. The new insights of this paper should be highlighted, and the language should be concise, generally around 200 words. To facilitate literature retrieval, keywords (three to five) should be provided on a new line below the abstract on this page.
  The first page of the paper should contain an abstract in Chinese. It should state the purpose, research methods, results, and conclusions. The new insights of this paper should be highlighted, and the language should be concise, generally around 200 words. To facilitate literature retrieval, keywords (three to five) should be provided on a new line below the abstract on this page.
]

#toc()

#show: mainmatter

= 绪 论

== 列表

=== 有序列表

+ #kouhu(builtin-text: "aspirin", length: 10)
+ #kouhu(builtin-text: "aspirin", offset: 2, length: 10)
  + #kouhu(builtin-text: "aspirin", offset: 3, length: 5)
  + #kouhu(builtin-text: "aspirin", offset: 3, length: 10)
  + #kouhu(builtin-text: "aspirin", offset: 3, length: 15)

=== 无序列表

- #kouhu(builtin-text: "zhufu", length: 15)
- #kouhu(builtin-text: "zhufu", offset: 2, length: 15)
  - #kouhu(builtin-text: "zhufu", offset: 3, length: 15)
  - #kouhu(builtin-text: "zhufu", offset: 3, length: 15)
  - #kouhu(builtin-text: "zhufu", offset: 6, length: 15)

=== 术语（`Latex` 中的段落）

/ simp: #kouhu(builtin-text: "simp", length: 15)
/ 阿司匹林: #kouhu(builtin-text: "aspirin", length: 60)

== 代码

行内代码我们使用 \`\` 将其括起来，这与 `Markdown` 中的语法一致

行间代码， 也就是代码块，其语法与 `Markdown` 中一致，例如：

#raw("
```typ
  #let a = 1
```
")

其表现为，此时发现代码块的表现很差，且无法引用

#no-codly[
  ```typ
  #let a = 1
  ```
]

因此，这里我们使用包 `codly` 来美化代码块，并将其放入到下文的图表中，进行引用，`@lst:<key>` 来引用代码块，例如下面的代码，我们使用语句 `@lst:fib-fn-py` 来引用，即@lst:fib-fn-py

#figure(caption: "Python 实现的斐波那契函数")[
  ```py
  def fib(n):
    if n <= 1:
      return n
    return fib(n - 1) + fib(n - 2)
  ```
]<fib-fn-py>

关于 `codly` 的更多用法请阅读#link("https://typst.app/universe/package/codly")[参考文档]

== 图表

=== 表格

在这里引用表格，例如同一页中的表格：@tbl:usual-table，以及不同页中的表格，例如三线表：@tbl:three-line-table

我们使用 `@tbl:<label>` 来进行表的引用，其中 `<label>` 是跟在表格后的标签，使用尖括号括起来，例如下面的@tbl:usual-table，我们使用命令 `@tbl:usual-table` 即可引用。

#align(
  center,
  (
    stack(dir: ltr)[
      #figure(
        table(
          align: center + horizon,
          columns: 4,
          [x], [1], [2], [3],
          [y], [5 ms], [6 ms], [0.7 ms],
        ),
        caption: [常用表格示例],
      )<usual-table>
    ]
  ),
)

#align(
  center,
  (
    stack(dir: ltr)[
      #figure(
        table(
          align: center + horizon,
          columns: 4,
          stroke: none,
          table.hline(),
          [x], [y], [z], [t],
          table.hline(stroke: .5pt),
          [11], [5 ms], [3], [0.7],
          [3000], [80 ms], [1111], [0.9],
          table.hline()
        ),
        caption: [三线表示例],
      )<three-line-table>
    ]
  ),
)

=== 图片

我们可以插入图片，也可以修改图片的展示大小，引用图片，例如@fig:ida-star-50, @fig:ida-star-20

我们通过函数 `#figure` 来表示一个图片，在其中通过 `image` 函数来导入一张图片，格式可以是 `png`, `svg` `jpg` 等常见格式，可以通过 `width` 等参数来调整图片的大小和位置。例如，`width: 50%` 表示图片宽度为页面宽度的 50%，`height: auto` 表示高度自适应，`align: center` 表示图片居中显示。

我们使用 `@fig:<label>` 来进行表的引用，其中 `<label>` 是跟在图片后的标签，使用尖括号括起来，例如下面的@fig:ida-star-20，我们使用命令 `@fig:ida-star-20` 即可引用。

#figure(
  image("fig/ida-star-1.png", width: 50%),
  caption: [IDA\* 算法示例， 50% 比例缩放],
)<ida-star-50>

#figure(
  image("fig/ida-star-1.png", width: 20%),
  caption: [IDA\* 算法示例， 20% 比例缩放],
)<ida-star-20>

=== 子图

暂时无法实现子图，可以使用 #link("https://app.diagrams.net/")[Draw.io] 等网站绘制完子图，然后导出一个大图，贴到论文中。

== 数学公式

数学公式分为行内公式与行间公式，其中，行内公式不会出现编号和引用，行间公式可以会在最右侧显示编号，并且可以引用。

例如，这是一个简单的行内公式 $sum_(i=1)^n a_i$，这是一个复杂的行内公式：$U(H, t, p) = product^p_(j=1)product_k e^((-i H_k t)/n), H = sum_k H_k$


下面是一个行间公式，我们可以通过将其编号为 `<nabla>`，然后通过 `@eqt:nabla` 来引用，例如@eqt:nabla

$
  nabla L = partial L / partial x
$<nabla>

@eqt:sgd-demo 是一个复杂的行间公式，这里我们使用 `&` 作为锚点进行对齐，这与 `Latex` 中是一致的，区别是我们不需要写 `\begin{aligned}` 与 `\end{aligned}`
$
  (w^((i+1)), b^((i+1))) &= (w^((i)), b^((i))) - alpha nabla "Loss"(
    w^((i)), b^((i))
  ) \
  &= (w^((i)), b^((i))) - alpha (
    (partial "Loss")(partial w), (partial "Loss")(partial b)
  )\
  &= (w^((i)), b^((i))) - alpha (
    1 / N sum^N_(j=1)x_j(b^((i)) + w^((i)T)x_j - y_j), \
    &&1 / N sum^N_(j=1)(b^((i))+w^((i)T)x_j - y_j)
  )
$<sgd-demo>

== 参考文献的引用

我们通过 `.bib` 文件来导入参考文献，文件名可以任意选择，通过选项：`bibliography: bibliography.with("ref.bib")` 进行导入，这里我们只需要将 网站上赋值的 `biblatex` 引用赋值粘贴到 `ref.bib` 中即可。

随后，通过 `#cite(<key>)` 进行引用，其中 `key` 是在 `.bib` 中设置的键。

在示例中，我们可以引用 `ref.bib` 文件中的内容，例如《Deep Learning》#cite(<goodfellow2016deep>)，引用2#cite(<丁文祥2000>)

当然，我们也可以通过简单的方式，`@key` 的语法糖即可引用，例如上述的《Deep Learning》@goodfellow2016deep，引用2@丁文祥2000

在 `ref.bib` 中，如@lst:ref-demo 所示，引用的部分条目为：

#figure(caption: "参考文献bib文件部分示例")[
  ```bib
  @article{丁文祥2000,
    title={数字革命与竞争国际化},
    author={丁文祥},
    journal={中国青年报},
    year={2000},
    month={11-20},
    number={15}
  }

  @book{goodfellow2016deep,
    title = {Deep learning},
    author = {Goodfellow, Ian and Bengio, Yoshua and Courville, Aaron and Bengio, Yoshua},
    volume = {1},
    year = {2016},
    publisher = {MIT Press}
  }
  ```
]<ref-demo>

第一行的内容即为引用所需的 `key`。

= 正文

== 正文子标题

=== 正文子子标题

正文内容

*需要注意，标题只支持到三级标题，不支持四级标题*，如果需要四级标题，请使用术语，也就是：

\ 术语（term）


使用 `#pagebreak()` 手动分页
#pagebreak()

= 更多正文

#fence()

#nenu-bibliography(full: true)

#acknowledgement[
  #kouhu(length: 100)
]
