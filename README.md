# 西西里岛与阿拉伯文化的关系

南方科技大学《阿拉伯世界的1500年》课程期末报告（LaTeX 源稿）。

## 内容

- 主题：西西里岛与阿拉伯文化的互动（诺曼时期混合文明）
- 引用格式：IEEE 顺序编码制 `[1]`
- 正文约 4500 字（不含参考文献与引用标注）

## 编译

**Windows（推荐）**：双击 `compile.bat`，或在本目录执行：

```bat
xelatex -interaction=nonstopmode main.tex
xelatex -interaction=nonstopmode main.tex
```

**图片**：若 `images/` 为空，将课程初稿 `*.docx` 放在本目录后运行：

```bat
python extract_images.py
```

（可选：`pip install pillow` 以自动压缩大图。）

## 文件说明

| 文件 | 说明 |
|------|------|
| `main.tex` | 报告正文与参考文献 |
| `references.bib` | 备用文献库（当前正文使用 `thebibliography`） |
| `compile.bat` | 一键编译 |
| `extract_images.py` | 从 docx 提取并压缩图片 |
| `编译说明.txt` | 常见问题 |

## 小组

课程小组合作报告，提交前请核对封面作者、学号等信息。
